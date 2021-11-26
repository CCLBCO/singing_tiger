import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'artist_id.dart';
import '../constants.dart';

class SongID{
  bool nextPageToggle = Random().nextBool();
  int randomSongNumber = Random().nextInt(49);
  int randomSongPage = 1;
  late int songID;
  late String songTitle;
  int? nextPage;
  late bool hasNextPage;

  Future<int> getSongID(String aName) async {
    int artistID = await getArtistID(artistName: aName);
    // https://genius.p.rapidapi.com/search?q=Taylor%20Swift&rapidapi-key=3adb15db4cmsh86fc7b52f545f07p162563jsn44fafc528771
    Uri songPath = Uri.parse('https://genius.p.rapidapi.com/artists/'
        '$artistID/songs'
        '?per_page=50'
        '&page=$randomSongPage'
        '&sort=popularity' //to result prioritizing popular songs
        '&rapidapi-key=$kApi_key');

    http.Response songResponse = await http.get(songPath);
    var songData = json.decode(songResponse.body);
    nextPage = songData['response']['next_page'];
    hasNextPage = (nextPage != null);

    if (songResponse.statusCode == 200) {
      for (randomSongPage = 1; hasNextPage && nextPageToggle;
      nextPageToggle = Random().nextBool()) {
        randomSongPage++;
      }
      songID = songData['response']['songs'][randomSongNumber]['id'];
      songTitle = songData['response']['songs'][randomSongNumber]['title'];

      // print("song ID is $songID");
      // print("song Title is $songTitle");
      // print("next page is $nextPage");
      return songID;
    } else {
      return 0;
    }
  }

}


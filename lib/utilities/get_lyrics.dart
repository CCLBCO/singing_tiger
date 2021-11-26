import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import '../utilities/song_id.dart';
import 'dart:convert';
import '../constants.dart';

class GetLyrics {
  var regex = RegExp(r'^\[Chorus\]|^\[Chorus: |^\[Chorus ');
  var line = "[Chorus: Olivia Hyeju]";

  Future<String> getLyricsURL({required String artistName}) async {
    int songID = await SongID().getSongID(artistName);
    Uri songPath = Uri.parse('https://genius.p.rapidapi.com/songs/'
        '$songID/'
        '?rapidapi-key=$kApi_key');
    http.Response soundURLResponse = await http.get(songPath);
    var soundData = json.decode(soundURLResponse.body);

    if (soundURLResponse.statusCode == 200) {
      String lyricsUrl = soundData['response']['song']['url'];
      print(lyricsUrl);
      return lyricsUrl;
    } else {
      return 'no lyrics!';
    }
  }

  Future<List<String>> pickLyrics({required String artistName}) async {
    String aN = artistName;
    String lyricsUrl = await getLyricsURL(artistName: aN);
    var urlLyric =
        Uri.parse('https://genius.com/Taylor-swift-all-too-well-lyrics');
    var lyricsResponse = await http.get(urlLyric);

    List<String> wordsOfLyrics = [];
    String wholeLyrics;
    var lyricsHtml;

    if (lyricsResponse.statusCode == 200) {
      print("we in genius!");

      do {
        var document = parser.parse(lyricsResponse.body);
        lyricsHtml = document.getElementsByClassName('lyrics');
        print(lyricsHtml);
        wholeLyrics = lyricsHtml[0].text;
        print(wholeLyrics.length);
      } while (lyricsHtml.isEmpty == true);

      bool hasChorus = false;
      // print(wholeLyrics);
      var lyricsByLine = wholeLyrics.split("\n");
      // print(lyricsByLine[0]);
      String chorusCheck;

      for (int i = 0; !hasChorus; ++i) {
        chorusCheck = lyricsByLine[i];
        if (regex.hasMatch(chorusCheck) == true) {
          int indexOfChorus = i;

          for (int x = indexOfChorus; lyricsByLine[x].isEmpty != true; x++) {
            wordsOfLyrics.add(lyricsByLine[x]);
          }

          hasChorus = true;
        }
      }
    } else {
      print("ERROR IN PICK LYRICS ELSE: ${lyricsResponse.statusCode}.");
      return wordsOfLyrics;
    }

    return wordsOfLyrics;
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';

Future<int> getArtistID({required String artistName}) async {
  //var artistName = "Taylor Swift";

  // Base API url
  var searchArtist = artistName
      .replaceAll(" ", "%20")
      .replaceAll('&', '%26')
      .replaceAll('?', '%3F')
      .replaceAll(':', '%3FA');

  // https://genius.p.rapidapi.com/search?q=Taylor%20Swift&rapidapi-key=3adb15db4cmsh86fc7b52f545f07p162563jsn44fafc528771
  Uri searchPath = Uri.parse('https://genius.p.rapidapi.com/search?'
      'q=$searchArtist'
      '&rapidapi-key=$kApi_key');
  http.Response searchResponse = await http.get(searchPath);

  if (searchResponse.statusCode == 200) {
    var  searchData = json.decode(searchResponse.body);
    int artistID = searchData['response']['hits'][0]['result']['primary_artist']['id'];
    // print("artistID is $artistID");
    return artistID;
  } else {
    return 0;
  }
}

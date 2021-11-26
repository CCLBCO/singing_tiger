import 'package:singing_tiger_test/utilities/song_title.dart';

import 'song_title.dart';

class TitleScrambler{

  late String title;
  late String scrambled;

  Future<String> Scramble(String title) async {
    scrambled = scrambleTitle(title);
    return scrambled;
  }

  Future<String> getSongTitle(String artistName) async{
    title = await Song().getSongTitle(artistName);
    title = title.toUpperCase().split(" (")[0];
    print(title);
    return title;
  }

  String scrambleTitle(String sT) {
    String temp;
    List <String> toScramble = sT.split(" ");
    List<String> newScramble = [];

    for (int i = 0; i < toScramble.length; i++){
      temp = wordScramble(toScramble[i]);
      newScramble.add(temp);
    }

    StringBuffer sb = new StringBuffer();

    for (String ch in newScramble) {
      sb.write(ch + " ");
    }

    String scrambledWord = sb.toString();

    print(scrambledWord);

    return scrambledWord;

  }

  String wordScramble(String word){
    List <String> wordScramble = word.split("");
    wordScramble.shuffle();
    StringBuffer sb = new StringBuffer();

    for (String ch in wordScramble) {
      sb.write(ch);
    }

    String scrambledWord = sb.toString();
    return scrambledWord;
  }



}
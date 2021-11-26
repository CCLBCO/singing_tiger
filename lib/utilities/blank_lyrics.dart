import 'dart:math';
import 'get_lyrics.dart';

class BlankLyrics {
  late List<String> chorus = [];
  late int rnd;

  Future<List<String>> getChorus(String aN) async {
    chorus = await GetLyrics().pickLyrics(artistName: aN);
    chorus = cleanCommas(chorus);
    chorus = toArray(chorus);
    print("chorus is: ${chorus}");
    return chorus;
  }

  // rnd = random.nextInt(chorus.length);

  List<String> getBlankChorus(List<String> chorus, int rnd) {
    chorus.replaceRange(rnd, rnd + 1, ["_"]);
    print("chorus is: ${chorus}");
    return chorus;
  }

  String getRemoved(List<String> chorus, int rnd) {
    String removedWord = chorus.removeAt(rnd);
    print("Removed Word: $removedWord");
    return removedWord;
  }

  List<String> cleanCommas(List<String> chorus) {
    StringBuffer sb = new StringBuffer();

    for (String ch in chorus) {
      sb.write(ch + " ");
    }

    String scrambledWord = sb.toString();
    scrambledWord = scrambledWord.replaceAll(',', "");

    return scrambledWord.split(" ");
  }

  List<String> toArray(List<String> chorus) {
    List<String> newArray = [];
    print(chorus[0]);

    for (int i = 1; i < chorus.length; i++) {
      newArray = newArray + chorus[i].split(" ");
    }

    print(newArray);
    return newArray;
  }
}

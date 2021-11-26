import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import '../constants.dart';
import '../utilities/string_scrambler.dart';
import '../utilities/blank_lyrics.dart';
import '../game_model/scramble_song_title.dart';
import '../game_model/fill_in_blank.dart';
import 'game_page.dart';
import 'dart:async';
import 'dart:math';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //late: since it'll be initialized at run-time
  String artistName1 = '';
  String artistName2 = '';
  String artistName3 = '';

  VoidCallback? button = null;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    TitleScrambler ts = TitleScrambler();
    BlankLyrics bl = BlankLyrics();

    Future<ScrambledSongGame> getScrambledGameComponent(String an) async {
      String correctTitle = await ts.getSongTitle(an);
      print('correctTitle = $correctTitle');
      String scrambledTitle = await ts.Scramble(correctTitle);
      print('scrambledTitle = $scrambledTitle');

      return ScrambledSongGame(
          scrambledSongTitle: scrambledTitle, songTitle: correctTitle);
    };

    Future<FillInBlankGame> getFillInBlankGameComponent(String an) async {
      List<String> lyrics = await bl.getChorus(an);
      int rnd = Random().nextInt(lyrics.length);
      List<String> blankedLyrics = await bl.getBlankChorus(lyrics, rnd);
      print('Lyrics that has a blank = $blankedLyrics');
      String blanked = await bl.getRemoved(lyrics, rnd);
      print('blanked lyric part = $blankedLyrics');
      return FillInBlankGame(blankedLyricsList: blankedLyrics, blanked: blanked);
    }

    void sendToGamePage() async {
      ScrambledSongGame ssg1 = await getScrambledGameComponent(artistName1);
      ScrambledSongGame ssg2 = await getScrambledGameComponent(artistName2);
      ScrambledSongGame ssg3 = await getScrambledGameComponent(artistName3);
      FillInBlankGame fib1 = await getFillInBlankGameComponent(artistName1);
      FillInBlankGame fib2 = await getFillInBlankGameComponent(artistName2);
      FillInBlankGame fib3 = await getFillInBlankGameComponent(artistName3);

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => GamePage(
                artistName1: artistName1,
                artistName2: artistName2,
                artistName3: artistName3,
                ssg1: ssg1,
                ssg2: ssg2,
                ssg3: ssg3,
              )));
    }

    if (artistName1.isNotEmpty &&
        artistName2.isNotEmpty &&
        artistName3.isNotEmpty) {
      button = () {
        sendToGamePage();
      };
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/arcade.png"),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Center(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      70.0, screenHeight * 3 / 11, 70.0, screenHeight * 2 / 6),
                  //padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GlowText(
                        "ENTER YOUR ARTISTS",
                        style: kEnterArtistsTextStyle,
                      ),
                      Material(
                        elevation: 5.0,
                        shadowColor: Color(0xFFFFE600),
                        borderRadius: BorderRadius.circular(15),
                        borderOnForeground: true,
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Color(0xFFFFE600)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Color(0xFFFFE600)),
                            ),
                            hintText: 'ARTIST 1',
                            hintStyle: kHintTextStyle,
                            //fillColor: Colors.white,
                            filled: false,
                          ),
                          onChanged: (inputtedArtist1) {
                            artistName1 = inputtedArtist1;
                          },
                        ),
                      ),
                      Material(
                        elevation: 5.0,
                        shadowColor: Color(0xFFFFE600),
                        borderRadius: BorderRadius.circular(15),
                        borderOnForeground: true,
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Color(0xFFFFE600)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Color(0xFFFFE600)),
                            ),
                            hintText: 'ARTIST 2',
                            hintStyle: kHintTextStyle,
                            //fillColor: Colors.white,
                            filled: false,
                          ),
                          onChanged: (inputtedArtist2) {
                            artistName2 = inputtedArtist2;
                          },
                        ),
                      ),
                      Material(
                        elevation: 5.0,
                        shadowColor: Color(0xFFFFE600),
                        borderRadius: BorderRadius.circular(15),
                        borderOnForeground: true,
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Color(0xFFFFE600)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Color(0xFFFFE600)),
                            ),
                            hintText: 'ARTIST 3',
                            hintStyle: kHintTextStyle,
                            //fillColor: Colors.white,
                            filled: false,
                          ),
                          onChanged: (inputtedArtist3) {
                            artistName3 = inputtedArtist3;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: button == null ? 0 : 120,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF000000).withAlpha(60),
                        blurRadius: 20.0,
                        spreadRadius: 0.0,
                        offset: Offset(
                          0.0,
                          3.0,
                        ),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 30.0),
                    child: ElevatedButton(
                        style: button == null
                            ? kDisabledNextButtonStyle
                            : kEnabledNextButtonStyle,
                        child: Text(
                          "NEXT",
                          style: kNextButtonTextStyle,
                        ),
                        onPressed: button
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => InputPage()));
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

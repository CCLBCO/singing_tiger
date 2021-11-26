import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import '../constants.dart';
import '../game_model/scramble_song_title.dart';
import '../utilities/score_keeper.dart';


class ScrambledGamePage extends StatefulWidget {
  ScrambledGamePage({required this.ssg, required this.sk});

  final ScrambledSongGame ssg;
  final ScoreKeeper sk;

  @override
  _ScrambledGamePageState createState() => _ScrambledGamePageState();
}

class _ScrambledGamePageState extends State<ScrambledGamePage> {
  String? scrambledTitleAnswer;
  int ssgScore = 100;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String correctAnswer = widget.ssg.songTitle;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/zoomed.png"),
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
                      70.0, screenHeight * 3 / 9, 70.0, screenHeight * 2 / 6),
                  //padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GlowText(
                        "SCRAMBLED",
                        style: kEnterArtistsTextStyle,
                      ),
                      GlowText(
                        widget.ssg.scrambledSongTitle,
                        style: kGameTextStyle,
                        textAlign: TextAlign.center,
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
                            hintText: 'ANSWER',
                            hintStyle: kHintTextStyle,
                            //fillColor: Colors.white,
                            filled: false,
                          ),
                          onChanged: (answer) {
                            scrambledTitleAnswer = answer.toUpperCase();
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
                  width: 120,
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
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 120.0),
                    child: GlowButton(
                      color: kGameButtonColor,
                      child: Text(
                        "GO!",
                        style: kNextButtonTextStyle,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            if (scrambledTitleAnswer!.toUpperCase() ==
                                correctAnswer) {
                              print("scrambledTitleAnswer = " +
                                  scrambledTitleAnswer!);
                              if (widget.sk.isPlayerOneTurn()) {
                                widget.sk.addPlayerOneScore(ssgScore);
                                widget.sk.nowPlayerTwoTurn();
                                print("player one score = " +
                                    widget.sk.getPlayerOneScore().toString());

                              } else {
                                widget.sk.addPlayerTwoScore(ssgScore);
                                widget.sk.nowPlayerOneTurn();
                                print("player two score = " +
                                    widget.sk.getPlayerTwoScore().toString());
                              }
                            }
                            Navigator.of(context).pop();
                          },
                        );
                      },
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

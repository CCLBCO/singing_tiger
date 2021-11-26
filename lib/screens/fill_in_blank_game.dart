import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import '../constants.dart';
import '../game_model/fill_in_blank.dart';
import '../utilities/score_keeper.dart';

class FillInBlankGamePage extends StatefulWidget {
  FillInBlankGamePage({required this.fib, required this.sk});

  final FillInBlankGame fib;
  final ScoreKeeper sk;

  @override
  _FillInBlankGamePageState createState() => _FillInBlankGamePageState();
}

class _FillInBlankGamePageState extends State<FillInBlankGamePage> {
  String? fillInBlankAnswer;
  int fibScore = 100;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String correctAnswer = widget.fib.blanked;

    String getStringOfBlankedLyricsList() {
      List<String> blankedLyricsList = widget.fib.blankedLyricsList;
      late String blankedLyrics;
      for (int i = 0; i < blankedLyricsList.length; i++) {
        blankedLyrics = blankedLyrics + ' ' + blankedLyricsList[i];
      }
      return blankedLyrics;
    }

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
                        getStringOfBlankedLyricsList(),
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
                            fillInBlankAnswer = answer.toUpperCase();
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
                            if (fillInBlankAnswer!.toUpperCase() ==
                                correctAnswer) {
                              print("scrambledTitleAnswer = " +
                                  fillInBlankAnswer!);
                              if (widget.sk.isPlayerOneTurn()) {
                                widget.sk.addPlayerOneScore(fibScore);
                                widget.sk.nowPlayerTwoTurn();
                                print("player one score = " +
                                    widget.sk.getPlayerOneScore().toString());
                              } else {
                                widget.sk.addPlayerTwoScore(fibScore);
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

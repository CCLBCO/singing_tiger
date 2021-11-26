import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import '../constants.dart';
import '../game_model/scramble_song_title.dart';
import '../screens/scrambled_game_page.dart';
import '../utilities/score_keeper.dart';

late String an1;
late String an2;
late String an3;
ScoreKeeper sk = ScoreKeeper();

class GamePage extends StatefulWidget {
  GamePage(
      {required this.artistName1,
      required this.artistName2,
      required this.artistName3,
      required this.ssg1,
      required this.ssg2,
      required this.ssg3});

  final String artistName1;
  final String artistName2;
  final String artistName3;
  final ScrambledSongGame ssg1;
  final ScrambledSongGame ssg2;
  final ScrambledSongGame ssg3;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  // for the Scramble Title game buttons
  bool ssgButton1 = true;
  bool ssgButton2 = true;
  bool ssgButton3 = true;
  // for the Fill In Blanked buttons
  bool fibButton1 = true;
  bool fibButton2 = true;
  bool fibButton3 = true;
  // for the Name That Tune buttons
  bool nttButton1 = true;
  bool nttButton2 = true;
  bool nttButton3 = true;

  int scrambleTitlePoints = 100;
  int fillInLyricsPoints = 300;
  int nameThatTunePoints = 500;
  int player1Score = sk.getPlayerOneScore();
  int player2Score = sk.getPlayerTwoScore();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    FutureOr onGoBack(dynamic value) async {
      setState(() {
        player1Score = sk.getPlayerOneScore();
        print("player one score = " + player1Score.toString());
        player2Score = sk.getPlayerTwoScore();
        print("player two score = " + player2Score.toString());
      });
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
              Padding(
                padding: EdgeInsets.fromLTRB(
                    70.0, screenHeight * 3 / 14, 70.0, screenHeight * 2 / 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 40.0,
                          width: screenWidth / 5,
                          child: GlowText(
                            widget.artistName1.toUpperCase(),
                            style: kGameArtistsNameHeaderTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GlowButton(
                          onPressed: () {
                            setState(() {
                              ssgButton1 = false;
                              Route route = MaterialPageRoute(
                                builder: (context) => ScrambledGamePage(
                                  ssg: widget.ssg1,
                                  sk: sk,
                                ),
                              );
                              Navigator.push(context, route).then(onGoBack);
                              //   Navigator.of(context)
                              //       .push(MaterialPageRoute(
                              //           builder: (context) =>
                              //               ScrambledGamePage(ssg: widget.ssg1)))
                              //       .then(onGoBack);
                            });
                          },
                          width: ssgButton1 ? 70.0 : 0.0,
                          color: kGameButtonColor,
                          child: Text(
                            scrambleTitlePoints.toString(),
                            style: kGameButtonTextStyle,
                          ),
                        ),
                        GlowButton(
                          onPressed: () {
                            setState(() {
                              fibButton2 = false;
                            });
                          },
                          width: fibButton1 ? 70.0 : 0.0,
                          color: kGameButtonColor,
                          child: Text(
                            fillInLyricsPoints.toString(),
                            style: kGameButtonTextStyle,
                          ),
                        ),
                        GlowButton(
                          onPressed: () {
                            setState(() {
                              nttButton1 = false;
                            });
                          },
                          width: nttButton1 ? 70.0 : 0.0,
                          color: kGameButtonColor,
                          child: Text(
                            nameThatTunePoints.toString(),
                            style: kGameButtonTextStyle,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 40.0,
                          width: screenWidth / 5,
                          child: GlowText(
                            widget.artistName2.toUpperCase(),
                            style: kGameArtistsNameHeaderTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GlowButton(
                          onPressed: () {
                            setState(() {
                              ssgButton2 = false;
                              Route route = MaterialPageRoute(
                                builder: (context) => ScrambledGamePage(
                                  ssg: widget.ssg2,
                                  sk: sk,
                                ),
                              );
                              Navigator.push(context, route).then(onGoBack);
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => ScrambledGamePage(
                              //           ssg: widget.ssg2,
                              //         )));
                            });
                          },
                          width: ssgButton2 ? 70.0 : 0.0,
                          color: kGameButtonColor,
                          child: Text(
                            scrambleTitlePoints.toString(),
                            style: kGameButtonTextStyle,
                          ),
                        ),
                        GlowButton(
                          onPressed: () {
                            setState(() {
                              fibButton2 = false;
                            });
                          },
                          width: fibButton2 ? 70.0 : 0.0,
                          color: kGameButtonColor,
                          child: Text(
                            fillInLyricsPoints.toString(),
                            style: kGameButtonTextStyle,
                          ),
                        ),
                        GlowButton(
                          onPressed: () {
                            setState(() {
                              nttButton2 = false;
                            });
                          },
                          width: nttButton2 ? 70.0 : 0.0,
                          color: kGameButtonColor,
                          child: Text(
                            nameThatTunePoints.toString(),
                            style: kGameButtonTextStyle,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 40.0,
                          width: screenWidth / 5,
                          child: GlowText(
                            widget.artistName3.toUpperCase(),
                            style: kGameArtistsNameHeaderTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GlowButton(
                          onPressed: () {
                            ssgButton3 = false;
                            Route route = MaterialPageRoute(
                              builder: (context) => ScrambledGamePage(
                                ssg: widget.ssg3,
                                sk: sk,
                              ),
                            );
                            Navigator.push(context, route).then(onGoBack);
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => ScrambledGamePage(
                            //           ssg: widget.ssg3,
                            //         )));
                          },
                          width: ssgButton3 ? 70.0 : 0.0,
                          color: kGameButtonColor,
                          child: Text(
                            scrambleTitlePoints.toString(),
                            style: kGameButtonTextStyle,
                          ),
                        ),
                        GlowButton(
                          onPressed: () {
                            setState(() {
                              fibButton3 = false;
                            });
                          },
                          width: fibButton3 ? 70.0 : 0.0,
                          color: kGameButtonColor,
                          child: Text(
                            fillInLyricsPoints.toString(),
                            style: kGameButtonTextStyle,
                          ),
                        ),
                        GlowButton(
                          onPressed: () {
                            setState(() {
                              nttButton3 = false;
                            });
                          },
                          width: nttButton3 ? 70.0 : 0.0,
                          color: kGameButtonColor,
                          child: Text(
                            nameThatTunePoints.toString(),
                            style: kGameButtonTextStyle,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, screenHeight * 3 / 5, 0, screenHeight * 2 / 10),
                  child: Container(
                    height: 50.0,
                    width: screenWidth / 2,
                    child: GlowText(
                      sk.isPlayerOneTurn()
                          ? 'PLAYER ONE\'S TURN'
                          : 'PLAYER TWO\'S TURN',
                      style: kGameTurnTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    70.0, screenHeight / 6, 70.0, screenHeight / 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GlowText(
                          'PLAYER ONE',
                          style: kScoreKeeperHeaderTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          width: 120,
                          decoration: BoxDecoration(
                            color: kScoreBoxColor,
                            borderRadius: BorderRadius.circular(10.0),
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
                            padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                            child: Text(
                              player1Score.toString(),
                              style: kScoreKeeperTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GlowText(
                          'PLAYER TWO',
                          style: kScoreKeeperHeaderTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          width: 120,
                          decoration: BoxDecoration(
                            color: kScoreBoxColor,
                            borderRadius: BorderRadius.circular(10.0),
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
                            padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                            child: Text(
                              player2Score.toString(),
                              style: kScoreKeeperTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

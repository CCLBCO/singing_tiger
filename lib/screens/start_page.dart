import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
//import '../get_artist_songs.dart';
//import '../get_lyrics.dart';
import '../constants.dart';
import 'input_page.dart';
import 'game_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  void getRandomSongLyrics() async {
    //GetLyrics gl = new GetLyrics();
    //GetArtistSongs gas = new GetArtistSongs();

    //gl.getLyrics(artistName: "Taylor Swift");
  }

  @override
  Widget build(BuildContext context) {
    getRandomSongLyrics();

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/zoomed.png"),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 220.0, 10.0, 90.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GlowText(
                        "SINGING",
                        style: kWelcomeTextStyle,
                      ),
                      GlowText(
                        "TIGER",
                        style: kWelcomeTextStyle2,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 146.0, 30.0, 0),
                    child: Image.asset("images/singing_tiger_mascot.GIF"),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 120,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 120.0),
                    child: GlowButton(
                        color: kPlayButtonColor,
                        child: Text(
                          "PLAY",
                          style: kPlayButtonTextStyle,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => InputPage()));
                          //builder: (context) => GamePage()));
                        }),
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

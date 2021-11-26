import 'package:flutter/material.dart';

// API key
const kApi_key = '3adb15db4cmsh86fc7b52f545f07p162563jsn44fafc528771';

const kSingingTigerHeaderColor = Color(0xFFF7C86B);
const kGameHeadersColor = Color(0xFFFFE600);
const kPlayButtonColor = Color(0xFFFFC672);
const kShadowColor = Color(0xFFFFE600);
const kHintTextColor = Color(0xFFBBBBBB);
const kDisabledColor = Color(0xFFC4A466);
const kEnabledColor = Color(0xFFFFE600);
const kGameButtonColor = Color(0xFFFFE600);
const kGameTurnTextColor = Color(0xFF961E05);
const kScoreHeaderColor = Color(0xFFFFE600);
const kScoreBoxColor = Colors.black;
const kGameTextColor = Colors.white;

const kWelcomeTextStyle = TextStyle(
    fontFamily: 'Press Start 2P',
    fontSize: 35.0,
    color: kSingingTigerHeaderColor);

const kWelcomeTextStyle2 = TextStyle(
    fontFamily: 'Press Start 2P',
    fontSize: 35.0,
    color: kSingingTigerHeaderColor);

const buttonTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 18.0,
  color: kGameTextColor,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.6,
);

final ButtonStyle kPlayButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: Color(0xffF7C86B),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
);

const kPlayButtonTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 18.0,
  color: Color(0xFF1A0000),
  fontWeight: FontWeight.bold,
  letterSpacing: 1.6,
);

const kEnterArtistsTextStyle = TextStyle(
    fontFamily: 'Press Start 2P', fontSize: 15.0, color: kGameHeadersColor);

const kHintTextStyle = TextStyle(
    fontFamily: 'Press Start 2P', fontSize: 10.0, color: kHintTextColor);

final ButtonStyle kDisabledNextButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: kDisabledColor,
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
);

final ButtonStyle kEnabledNextButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: kEnabledColor,
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
);

const kNextButtonTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 18.0,
  color: Colors.black,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.6,
);

const kGameArtistsNameHeaderTextStyle =
    TextStyle(fontFamily: 'Roboto', fontSize: 15.0, color: kGameHeadersColor);

const kGameButtonTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 18.0,
  color: Colors.black,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.6,
);

const kGameTurnTextStyle = TextStyle(
    fontFamily: 'Press Start 2P', fontSize: 12.0, color: kGameTurnTextColor);

const kScoreKeeperHeaderTextStyle =
    TextStyle(fontFamily: 'Roboto', fontSize: 15.0, color: kScoreHeaderColor);

const kScoreKeeperTextStyle = TextStyle(
  fontFamily: 'Press Start 2P',
  fontSize: 15.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.6,
);

const kGameTextStyle =
    TextStyle(fontFamily: 'Roboto', fontSize: 23.0, color: kGameTextColor);

class ScoreKeeper {
  int _playerOneScore = 0;
  int _playerTwoScore = 0;
  bool _playerOneTurn = true;
  bool _playerTwoTurn = false;

  int getPlayerOneScore() {
    return _playerOneScore;
    print("player one's score is now: $_playerOneScore");
  }
  int getPlayerTwoScore() {
    return _playerTwoScore;
    print("player two's score is now: $_playerTwoScore");
  }

  bool isPlayerOneTurn() {
    return _playerOneTurn;
    print("player one turn? $_playerOneTurn");
    print("player two turn? $_playerTwoTurn");
  }
  bool isPlayerTwoTurn() {
    return _playerTwoTurn;
    print("player one turn? $_playerOneTurn");
    print("player two turn? $_playerTwoTurn");
  }

  void nowPlayerOneTurn() {
    _playerOneTurn = true;
    _playerTwoTurn = false;
    print("player one turn? $_playerOneTurn");
    print("player two turn? $_playerTwoTurn");
  }
  void nowPlayerTwoTurn() {
    _playerTwoTurn = true;
    _playerOneTurn = false;
    print("player one turn? $_playerOneTurn");
    print("player two turn? $_playerTwoTurn");
  }

  void addPlayerOneScore(int gameScore) {
    _playerOneScore += gameScore;
    print("player one's score is now: $_playerOneScore");
  }

  void addPlayerTwoScore(int gameScore) {
    _playerTwoScore += gameScore;
    print("player two's score is now: $_playerTwoScore");
  }
}
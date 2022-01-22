import 'dart:math';

class Game {
  int? _answer;
  int _guessCount = 0;
  static List<int> roundC = [];
  Game({int max = 100}) {
    var r = Random();
    _answer = r.nextInt(max) + 1;
  }
  int get guessCount {
    roundC.add(_guessCount);
    return _guessCount;
  }

  int doGuess(int num) {
    _guessCount++;
    if (num > _answer!) {
      return 1;
    } else if (num < _answer!) {
      return -1;
    } else {
      return 0;
    }
  }
}
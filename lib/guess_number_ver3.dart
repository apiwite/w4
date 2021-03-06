import 'dart:io';
import 'game.dart';

void main() {
  while (true) {
    playGame();
    String? input;
    do {
      stdout.write('Play again? (Y/N): ');
      input = stdin.readLineSync();
    } while (input!.toLowerCase() != 'y' && input.toLowerCase() != 'n');
    if (input.toLowerCase() == 'n') break;
  }
  print('You have played ${Game.roundC.length} round');
  for (int i = 0; i < Game.roundC.length; i++) {
    print('ðYou Guess ${Game.roundC[i]} times in round ${i+1}');
  }

  // end of program
}

void playGame() {
  stdout.write('Enter a maximum number to random: ');
  String? enterNum = stdin.readLineSync();
  int? enterNumber = int.tryParse(enterNum!);
  Game game;
  if (enterNumber != null) {
    game = Game(max: enterNumber);
  } else {
    game = Game();
  }
  var isCorrect = false;

  print('âââââââââââââââââââââââââââââââââââââââââ');
  print('â            GUESS THE NUMBER            ');
  print('âââââââââââââââââââââââââââââââââââââââââ');

  do {
    stdout.write('â Guess the number between 1 and ${enterNumber}: ');
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);
    if (guess == null) {
      continue;
    }

    var result = game.doGuess(guess);

    if (result == 1) {
      print('â â $guess is TOO HIGH! â²');
      print('âââââââââââââââââââââââââââââââââââââââââ');
    } else if (result == -1) {
      print('â â $guess is TOO LOW! â¼');
      print('âââââââââââââââââââââââââââââââââââââââââ');
    } else if (result == 0) {
      print('â â $guess is CORRECT â¤, total guesses: ${game.guessCount}');
      print('âââââââââââââââââââââââââââââââââââââââââ');
      isCorrect = true;
    }
  } while (!isCorrect);

  print('â                 THE END                ');
  print('âââââââââââââââââââââââââââââââââââââââââ');
}
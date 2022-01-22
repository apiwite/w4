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
    print('🚀You Guess ${Game.roundC[i]} times in round ${i+1}');
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

  print('╔════════════════════════════════════════');
  print('║            GUESS THE NUMBER            ');
  print('╟────────────────────────────────────────');

  do {
    stdout.write('║ Guess the number between 1 and ${enterNumber}: ');
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);
    if (guess == null) {
      continue;
    }

    var result = game.doGuess(guess);

    if (result == 1) {
      print('║ ➜ $guess is TOO HIGH! ▲');
      print('╟────────────────────────────────────────');
    } else if (result == -1) {
      print('║ ➜ $guess is TOO LOW! ▼');
      print('╟────────────────────────────────────────');
    } else if (result == 0) {
      print('║ ➜ $guess is CORRECT ❤, total guesses: ${game.guessCount}');
      print('╟────────────────────────────────────────');
      isCorrect = true;
    }
  } while (!isCorrect);

  print('║                 THE END                ');
  print('╚════════════════════════════════════════');
}
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/data/models/player.dart';
import 'package:tic_tac_toe/data/models/tile_state.dart';
import 'package:tic_tac_toe/data/repositories/computer_repository.dart';

void main() {
  test('Computer chooses a valid empty cell', () {
    final repository = ComputerRepository();
    final board = [
      TileState.one,
      TileState.two,
      TileState.one,
      TileState.empty,
      TileState.empty,
      TileState.empty,
      TileState.empty,
      TileState.empty,
      TileState.empty,
    ];
    final move = repository.chooseMove(board, Player.two);
    expect(move, isNonNegative);
    expect(move, lessThan(board.length));
    expect(board[move], TileState.empty);
  });

  test('Computer chooses to protect against player win', () {
    final repository = ComputerRepository();
    final board = [
      TileState.one,
      TileState.two,
      TileState.empty,
      TileState.one,
      TileState.empty,
      TileState.empty,
      TileState.empty,
      TileState.empty,
      TileState.empty,
    ];
    final move = repository.chooseMove(board, Player.two);
    expect(move, 6);
  });

  test('Computer chooses to win', () {
    final repository = ComputerRepository();
    final board = [
      TileState.one,
      TileState.two,
      TileState.empty,
      TileState.empty,
      TileState.two,
      TileState.empty,
      TileState.empty,
      TileState.empty,
      TileState.one,
    ];
    final move = repository.chooseMove(board, Player.two);
    expect(move, 7);
  });

  test(
    'Computer chooses to protect rather to win because of simple iteration',
    () {
      final repository = ComputerRepository();
      final board = [
        TileState.one,
        TileState.two,
        TileState.one,
        TileState.one,
        TileState.two,
        TileState.empty,
        TileState.empty,
        TileState.empty,
        TileState.empty,
      ];
      final move = repository.chooseMove(board, Player.two);
      expect(move, 6);
    },
  );
}

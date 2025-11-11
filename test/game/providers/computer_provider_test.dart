import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/game/models/player.dart';
import 'package:tic_tac_toe/game/models/tile_state.dart';
import 'package:tic_tac_toe/game/providers/computer_provider.dart';

void main() {
  test('Computer chooses a valid empty cell', () {
    final container = ProviderContainer.test();
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
    final move = container.read(computerProvider).chooseMove(board, Player.two);
    expect(move, isNonNegative);
    expect(move, lessThan(board.length));
    expect(board[move], TileState.empty);
  });

  test('Computer chooses to protect against player win', () {
    final container = ProviderContainer.test();
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
    final move = container.read(computerProvider).chooseMove(board, Player.two);
    expect(move, 6);
  });

  test('Computer chooses to win', () {
    final container = ProviderContainer.test();
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
    final move = container.read(computerProvider).chooseMove(board, Player.two);
    expect(move, 7);
  });

  test('Computer chooses to protect rather to win because of simple iteration', () {
      final container = ProviderContainer.test();
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
      final move = container
          .read(computerProvider)
          .chooseMove(board, Player.two);
      expect(move, 6);
    },
  );
}

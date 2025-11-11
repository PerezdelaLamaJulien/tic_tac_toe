import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tic_tac_toe/game/models/game_mode.dart';
import 'package:tic_tac_toe/game/models/player.dart';
import 'package:tic_tac_toe/game/models/tile_state.dart';
import 'package:tic_tac_toe/game/providers/computer_provider.dart';
import 'package:tic_tac_toe/game/providers/game_provider.dart';

import 'game_notifier_test.mocks.dart';

@GenerateMocks([], customMocks: [MockSpec<Computer>(as: #MockComputer)])
void main() {
  test('initial state is correct', () {
    final container = ProviderContainer.test();
    final state = container.read(gameProvider);
    expect(state.board, List.filled(9, TileState.empty));
    expect(state.currentPlayer, Player.one);
    expect(state.mode, GameMode.local);
    expect(state.winner, isNull);
  });

  test('addPlayerMove alternates players and updates board', () {
    final container = ProviderContainer.test();
    container.read(gameProvider.notifier).addPlayerMove(0);
    var state = container.read(gameProvider);
    expect(state.board[0], TileState.one);
    expect(state.currentPlayer, Player.two);

    container.read(gameProvider.notifier).addPlayerMove(1);
    state = container.read(gameProvider);
    expect(state.board[1], TileState.two);
    expect(state.currentPlayer, Player.one);
  });

  test('cannot play on occupied cell', () {
    final container = ProviderContainer.test();
    container.read(gameProvider.notifier).addPlayerMove(0);
    var stateBefore = container.read(gameProvider);
    container.read(gameProvider.notifier).addPlayerMove(0);
    var stateAfter = container.read(gameProvider);
    expect(stateAfter.board, stateBefore.board);
  });

  test('detect victory in row', () {
    final container = ProviderContainer.test();

    final notifier = container.read(gameProvider.notifier);
    notifier.addPlayerMove(0); // X
    notifier.addPlayerMove(3); // O
    notifier.addPlayerMove(1); // X
    notifier.addPlayerMove(4); // O
    notifier.addPlayerMove(2); // X → win
    final state = container.read(gameProvider);
    expect(state.winner, Player.one);
    expect(state.winningLine, [0, 1, 2]);
  });

  test('start new game after win', () {
    final container = ProviderContainer.test();

    final notifier = container.read(gameProvider.notifier);
    notifier.addPlayerMove(0); // X
    notifier.addPlayerMove(3); // O
    notifier.addPlayerMove(1); // X
    notifier.addPlayerMove(4); // O
    notifier.addPlayerMove(2); // X → win
    var state = container.read(gameProvider);
    expect(state.winner, Player.one);
    notifier.startGameAgainstComputer(Player.one); // X

    state = container.read(gameProvider);
    expect(state.winner, null);
  });

  test('start game against computer and he made the first move', () async {
    final container = ProviderContainer.test();
    final notifier = container.read(gameProvider.notifier);
    await notifier.startGameAgainstComputer(Player.two);
    var state = container.read(gameProvider);
    expect(state.board.contains(TileState.two), true);
    expect(state.mode, GameMode.computer);
  });

  test('start game against computer and he react after first player move', () async {
      final container = ProviderContainer.test();
      final notifier = container.read(gameProvider.notifier);
      await notifier.startGameAgainstComputer(Player.one);
      await notifier.addPlayerMove(0); // X
      var state = container.read(gameProvider);
      expect(container.read(gameProvider).board.contains(TileState.two), true);
      expect(state.mode, GameMode.computer);
    },
  );

  test('addPlayerMove when endless is on and verify moves get removed', () {
    final container = ProviderContainer.test();
    final notifier = container.read(gameProvider.notifier);
    notifier.changeEndlessMode(true);
    notifier.startGameAgainstLocalPlayer(Player.one);
    notifier.addPlayerMove(0);
    notifier.addPlayerMove(1);
    notifier.addPlayerMove(4);
    notifier.addPlayerMove(7);
    notifier.addPlayerMove(2);
    notifier.addPlayerMove(8);
    var state = container.read(gameProvider);
    expect(state.endlessMode, true);
    expect(state.movesHistory.length, 6);
    notifier.addPlayerMove(5);
    state = container.read(gameProvider);
    expect(state.board[0], TileState.empty);
    expect(state.movesHistory.length, 6);
  });

  test('addComputerMove when endless is on and verify moves get removed', () async {
      final mockComputer = MockComputer();
      when(
        mockComputer.chooseMove([
          TileState.empty,
          TileState.empty,
          TileState.empty,
          TileState.empty,
          TileState.empty,
          TileState.empty,
          TileState.empty,
          TileState.empty,
          TileState.empty,
        ], Player.two),
      ).thenAnswer((_) => 0);

      when(
        mockComputer.chooseMove([
          TileState.two,
          TileState.one,
          TileState.empty,
          TileState.empty,
          TileState.empty,
          TileState.empty,
          TileState.empty,
          TileState.empty,
          TileState.empty,
        ], Player.two),
      ).thenAnswer((_) => 2);

      when(
        mockComputer.chooseMove([
          TileState.two,
          TileState.one,
          TileState.two,
          TileState.one,
          TileState.empty,
          TileState.empty,
          TileState.empty,
          TileState.empty,
          TileState.empty,
        ], Player.two),
      ).thenAnswer((_) => 4);

      when(
        mockComputer.chooseMove([
          TileState.two,
          TileState.one,
          TileState.two,
          TileState.one,
          TileState.two,
          TileState.empty,
          TileState.one,
          TileState.empty,
          TileState.empty,
        ], Player.two),
      ).thenAnswer((_) => 7);

      final container = ProviderContainer.test(
        overrides: [computerProvider.overrideWithValue(mockComputer)],
      );

      final notifier = container.read(gameProvider.notifier);
      notifier.changeEndlessMode(true);
      await notifier.startGameAgainstComputer(Player.two);
      await notifier.addPlayerMove(1);
      await notifier.addPlayerMove(3);
      await notifier.addPlayerMove(6);

      var state = container.read(gameProvider);
      expect(state.board[0], TileState.empty);
      expect(state.movesHistory.length, 6);
    },
  );
}

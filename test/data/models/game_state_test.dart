import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tic_tac_toe/data/models/game_mode.dart';
import 'package:tic_tac_toe/data/models/game_state.dart';
import 'package:tic_tac_toe/data/models/player.dart';
import 'package:tic_tac_toe/data/models/tile_state.dart';

import '../../mock_factory.dart';
import '../../mock_factory.mocks.dart';

void main() {
  final localizations = MockAppLocalizations();

  setUpAll(() {
    when(localizations.playerOneExtensionName).thenReturn("Joueur Bleu");
    when(localizations.playerTwoExtensionName).thenReturn("Joueur Rouge");
    when(localizations.gameExtensionStatusDefault).thenReturn("Qui seras le meilleur ?");
    when(localizations.gameExtensionStatusDraw).thenReturn("Match nul 😐");
    when(localizations.gameExtensionStatusWinner("Joueur Bleu")).thenReturn("Le Joueur Bleu a gagné 🎉");
    when(localizations.gameExtensionStatusWinner("Joueur Rouge")).thenReturn("Le Joueur Rouge a gagné 🎉");
    when(localizations.gameExtensionStatusTurnPlayer("Joueur Bleu")).thenReturn("Tour de Joueur Bleu");
  });

  test('initial state is correct', () {
    final localizations = MockAppLocalizations();
    when(
      localizations.gameExtensionStatusDefault,
    ).thenReturn("Qui seras le meilleur ?");

    final state = GameState.initial();
    expect(state.board, List.filled(9, TileState.empty));
    expect(state.currentPlayer, Player.one);
    expect(state.mode, GameMode.local);
    expect(state.winner, isNull);
    expect(state.winningLine, isNull);
    expect(state.winningLineState, isNull);
    expect(state.isDraw, false);
    expect(state.hasBegun, false);

    expect(state.status(localizations), "Qui seras le meilleur ?");
  });

  test('copyWith is working', () {
    var state = GameState.initial();
    final result = MockFactory().oneWonGameState;
    expect(state.status(localizations), "Qui seras le meilleur ?");
    state = state.copyWith(
      board: result.board,
      currentPlayer: result.currentPlayer,
      winner: result.winner,
      isDraw: result.isDraw,
      hasBegun: result.hasBegun,
      winningLine: result.winningLine,
      winningLineState: result.winningLineState,
      mode: result.mode,
    );

    expect(state.status(localizations), "Le Joueur Bleu a gagné 🎉");
  });

  test('draw state is correct', () {
    final state = MockFactory().drawGameState;
    expect(state.isDraw, true);
    expect(state.winner, null);
    expect(state.status(localizations), "Match nul 😐");
  });

  test('player one won state is correct', () {
    final state = MockFactory().oneWonGameState;
    expect(state.isDraw, false);
    expect(state.winner, Player.one);
    expect(state.winningLineState, isNotNull);
    expect(state.winningLine, isNotNull);
    expect(state.status(localizations), "Le Joueur Bleu a gagné 🎉");
  });

  test('player two won state is correct', () {
    final state = MockFactory().twoWonGameState;
    expect(state.isDraw, false);
    expect(state.winner, Player.two);
    expect(state.winningLineState, isNotNull);
    expect(state.winningLine, isNotNull);
    expect(state.status(localizations), "Le Joueur Rouge a gagné 🎉");
  });

  test('ongoing state is correct', () {
    final state = MockFactory().onGoingGameState;
    expect(state.status(localizations), "Tour de Joueur Bleu");
  });
}

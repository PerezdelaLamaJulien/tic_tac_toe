import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tic_tac_toe/data/models/player.dart';
import 'package:tic_tac_toe/data/models/tile_state.dart';

import '../../mock_factory.mocks.dart';


void main() {
  test('player one return good values', () {
    final localizations = MockAppLocalizations();
    when(localizations.playerOneExtensionName).thenReturn("Joueur Bleu");

    final player = Player.one;
    expect(player.playerName(localizations), "Joueur Bleu");
    expect(player.ownedTileState, TileState.one);
    expect(player.opponentTileState, TileState.two);
  });

  test('player two return good values', () {
    final localizations = MockAppLocalizations();
    when(localizations.playerTwoExtensionName).thenReturn("Joueur Rouge");

    final player = Player.two;
    expect(player.playerName(localizations), "Joueur Rouge");
    expect(player.ownedTileState, TileState.two);
    expect(player.opponentTileState, TileState.one);
  });
}

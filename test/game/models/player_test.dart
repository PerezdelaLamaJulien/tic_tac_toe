import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/game/models/player.dart';
import 'package:tic_tac_toe/game/models/tile_state.dart';


void main() {
  test('player one return good values', () {
    final player = Player.one;
    expect(player.playerName, "Joueur Bleu");
    expect(player.ownedTileState, TileState.one);
    expect(player.opponentTileState, TileState.two);
  });

  test('player two return good values', () {
    final player = Player.two;
    expect(player.playerName, "Joueur Rouge");
    expect(player.ownedTileState, TileState.two);
    expect(player.opponentTileState, TileState.one);
  });
}

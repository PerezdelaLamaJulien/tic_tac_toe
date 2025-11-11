import 'package:tic_tac_toe/game/models/tile_state.dart';

enum Player { one, two }

extension PlayerExtension on Player {
  String get playerName {
    switch (this) {
      case Player.one:
        return 'Joueur Bleu';
      case Player.two:
        return 'Joueur Rouge';
    }
  }

  TileState get ownedTileState {
    switch (this) {
      case Player.one:
        return TileState.one;
      case Player.two:
        return TileState.two;
    }
  }

  TileState get opponentTileState {
    switch (this) {
      case Player.one:
        return TileState.two;
      case Player.two:
        return TileState.one;
    }
  }
}

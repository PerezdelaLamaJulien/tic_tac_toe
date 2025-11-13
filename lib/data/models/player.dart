import 'package:tic_tac_toe/data/models/tile_state.dart';
import 'package:tic_tac_toe/presentation/l10n/app_localizations.dart';

enum Player { one, two }

extension PlayerExtension on Player {
  String playerName(AppLocalizations localization) {
    switch (this) {
      case Player.one:
        return localization.playerOneExtensionName;
      case Player.two:
        return localization.playerTwoExtensionName;
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

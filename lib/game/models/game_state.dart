import 'package:tic_tac_toe/game/models/player.dart';
import 'package:tic_tac_toe/game/models/tile_state.dart';
import 'package:tic_tac_toe/game/models/winning_line_state.dart';

class GameState {
  final List<TileState> board;
  final Player currentPlayer;
  final Player? winner;
  final bool isDraw;
  final bool hasBegun;
  final List<int>? winningLine;
  final WinningLineState? winningLineState;

  GameState({
    required this.board,
    required this.currentPlayer,
    this.winner,
    this.winningLine,
    this.winningLineState,
    this.hasBegun = false,
    this.isDraw = false,
  });

  factory GameState.initial() {
    return GameState(
      board: List.filled(9, TileState.empty),
      currentPlayer: Player.one,
    );
  }

  GameState copyWith({
    List<TileState>? board,
    Player? currentPlayer,
    Player? winner,
    bool? isDraw,
    bool? hasBegun,
    List<int>? winningLine,
    WinningLineState? winningLineState,
  }) {
    return GameState(
      board: board ?? this.board,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      winner: winner,
      isDraw: isDraw ?? this.isDraw,
      hasBegun: hasBegun ?? this.hasBegun,
      winningLine: winningLine ?? this.winningLine,
      winningLineState: winningLineState ?? this.winningLineState,
    );
  }
}

extension GameExtension on GameState {
  String get status {
    if (hasBegun) {
      if (winner != null) {
        return "Le ${winner!.playerName} a gagné 🎉";
      } else if (isDraw) {
        return "Match nul 😐";
      } else {
        return "Tour de ${currentPlayer.playerName}";
      }
    }
    return "Qui seras le meilleur ?";
  }
}

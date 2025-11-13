import 'package:tic_tac_toe/data/models/game_mode.dart';
import 'package:tic_tac_toe/data/models/player.dart';
import 'package:tic_tac_toe/data/models/tile_state.dart';
import 'package:tic_tac_toe/data/models/winning_line_state.dart';

class GameState {
  final List<TileState> board;
  final Player currentPlayer;
  final Player? winner;
  final bool isDraw;
  final bool hasBegun;
  final bool endlessMode;
  final GameMode mode;
  final List<int> movesHistory;
  final List<int>? winningLine;
  final WinningLineState? winningLineState;

  GameState({
    required this.board,
    required this.currentPlayer,
    required this.mode,
    required this.movesHistory,
    this.winner,
    this.winningLine,
    this.winningLineState,
    this.hasBegun = false,
    this.isDraw = false,
    this.endlessMode = false,
  });

  factory GameState.initial() {
    return GameState(
      board: List.filled(9, TileState.empty),
      movesHistory: [],
      currentPlayer: Player.one,
      mode: GameMode.local,
    );
  }

  GameState copyWith({
    List<TileState>? board,
    Player? currentPlayer,
    Player? winner,
    bool? isDraw,
    bool? hasBegun,
    bool? endlessMode,
    List<int>? winningLine,
    List<int>? movesHistory,
    WinningLineState? winningLineState,
    GameMode? mode,
  }) {
    return GameState(
      board: board ?? this.board,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      winner: winner,
      isDraw: isDraw ?? this.isDraw,
      hasBegun: hasBegun ?? this.hasBegun,
      endlessMode: endlessMode ?? this.endlessMode,
      winningLine: winningLine ?? this.winningLine,
      movesHistory: movesHistory ?? this.movesHistory,
      winningLineState: winningLineState ?? this.winningLineState,
      mode: mode ?? this.mode,
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

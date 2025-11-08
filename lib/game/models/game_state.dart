import 'package:tic_tac_toe/game/models/player.dart';
import 'package:tic_tac_toe/game/models/tile_state.dart';
import 'package:tic_tac_toe/game/models/winning_line_state.dart';

class GameState {
  final List<TileState> board;
  final Player currentPlayer;
  final Player? winner;
  final bool isDraw;
  final List<int>? winningLine;
  final WinningLineState? winningLineState;

  GameState({
    required this.board,
    required this.currentPlayer,
    this.winner,
    this.winningLine,
    this.winningLineState,
    this.isDraw = false,
  });

  factory GameState.initial() {
    return GameState(
      board: List.filled(9, TileState.empty),
      currentPlayer: Player.one, // todo : coin flip to define starter player
    );
  }

  GameState copyWith({
    List<TileState>? board,
    Player? currentPlayer,
    Player? winner,
    bool? isDraw,
    List<int>? winningLine,
    WinningLineState? winningLineState,
  }) {
    return GameState(
      board: board ?? this.board,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      winner: winner,
      isDraw: isDraw ?? this.isDraw,
      winningLine: winningLine ?? this.winningLine,
      winningLineState: winningLineState ?? this.winningLineState,
    );
  }
}

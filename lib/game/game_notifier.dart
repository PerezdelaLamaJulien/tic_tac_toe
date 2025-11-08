import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/game_state.dart';
import 'models/player.dart';
import 'models/tile_state.dart';
import 'models/winning_line_state.dart';

final gameProvider = NotifierProvider<GameNotifier, GameState>(GameNotifier.new,);

class GameNotifier extends Notifier<GameState> {
  @override
  GameState build() => GameState.initial();

  void playMove(int index) {
    if (state.board[index] != TileState.empty || state.winner != null) return;

    final newBoard = [...state.board];
    newBoard[index] = state.currentPlayer == Player.one ? TileState.one : TileState.two;

    final winner = _checkWinner(newBoard);
    final isDraw = !newBoard.contains(TileState.empty) && winner == null;

    state = state.copyWith(
      board: newBoard,
      currentPlayer: state.currentPlayer == Player.one ? Player.two : Player.one,
      winner: winner,
      isDraw: isDraw,
    );
  }

  void reset() => state = GameState.initial();

  Player? _checkWinner(List<TileState> tileStates) {
    Player? winner;
    final wins = <List<int>, WinningLineState>{
      [0, 1, 2]: WinningLineState.hori,
      [3, 4, 5]: WinningLineState.hori,
      [6, 7, 8]: WinningLineState.hori,
      [0, 3, 6]: WinningLineState.vert,
      [1, 4, 7]: WinningLineState.vert,
      [2, 5, 8]: WinningLineState.vert,
      [0, 4, 8]: WinningLineState.diagLR,
      [2, 4, 6]: WinningLineState.diagRL,
    };

    wins.forEach((combo, winningLineState) {
      final tileState = tileStates[combo[0]],
          two = tileStates[combo[1]],
          three = tileStates[combo[2]];
      if (tileState != TileState.empty && tileState == two && tileState == three) {
        state = state.copyWith(
          winningLine: combo,
          winningLineState: winningLineState,
        );
        winner = tileState == TileState.one ? Player.one : Player.two;
      }
    });

    return winner;
  }
}

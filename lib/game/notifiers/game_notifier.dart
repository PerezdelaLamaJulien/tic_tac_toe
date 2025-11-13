import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/game/models/game_mode.dart';
import 'package:tic_tac_toe/game/models/game_state.dart';
import 'package:tic_tac_toe/game/models/player.dart';
import 'package:tic_tac_toe/game/models/tile_state.dart';
import 'package:tic_tac_toe/game/models/winning_line_state.dart';
import 'package:tic_tac_toe/game/notifiers/stats_notifier.dart';
import 'package:tic_tac_toe/game/providers/computer_provider.dart';

class GameNotifier extends Notifier<GameState> {
  @override
  GameState build() => GameState.initial();

  Future<void> addPlayerMove(int index) async {
    if (state.board[index] != TileState.empty || state.winner != null) return;

    final newBoard = [...state.board];
    newBoard[index] = state.currentPlayer.ownedTileState;
    final moves = [...state.movesHistory, index];
    if (state.endlessMode && moves.length == 7) {
      newBoard[moves.first] = TileState.empty;
      moves.removeAt(0);
    }

    final winner = _checkWinner(newBoard);
    final isDraw = !newBoard.contains(TileState.empty) && winner == null;
    if (winner != null || isDraw) {
      _updateStats();
    }

    state = state.copyWith(
      board: newBoard,
      movesHistory: moves,
      currentPlayer: state.currentPlayer == Player.one
          ? Player.two
          : Player.one,
      winner: winner,
      isDraw: isDraw,
    );

    if (winner == null &&
        newBoard.contains(TileState.empty) &&
        state.mode == GameMode.computer) {
      await addComputerMove();
    }
  }

  Future<void> addComputerMove() async {
    final computer = ref.read(computerProvider);
    final computerMove = computer.chooseMove(state.board, state.currentPlayer);
    await Future.delayed(const Duration(milliseconds: 400));

    final newBoard = [...state.board];
    newBoard[computerMove] = state.currentPlayer.ownedTileState;
    final moves = [...state.movesHistory, computerMove];
    if (state.endlessMode && moves.length == 7) {
      newBoard[moves.first] = TileState.empty;
      moves.removeAt(0);
    }

    final winner = _checkWinner(newBoard);
    final isDraw = !newBoard.contains(TileState.empty) && winner == null;
    if (winner != null || isDraw) {
      _updateStats();
    }

    state = state.copyWith(
      board: newBoard,
      movesHistory: moves,
      currentPlayer: state.currentPlayer == Player.one
          ? Player.two
          : Player.one,
      winner: winner,
      isDraw: isDraw,
    );
  }

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
      if (tileState != TileState.empty &&
          tileState == two &&
          tileState == three) {
        state = state.copyWith(
          winningLine: combo,
          winningLineState: winningLineState,
        );
        winner = tileState == TileState.one ? Player.one : Player.two;
      }
    });

    return winner;
  }

  void startGameAgainstLocalPlayer(Player firstPlayer) {
    state = GameState(
      board: List.filled(9, TileState.empty),
      movesHistory: [],
      currentPlayer: firstPlayer,
      hasBegun: true,
      mode: GameMode.local,
      endlessMode: state.endlessMode,
    );
  }

  Future<void> startGameAgainstComputer(Player firstPlayer) async {
    state = GameState(
      board: List.filled(9, TileState.empty),
      movesHistory: [],
      currentPlayer: firstPlayer,
      hasBegun: true,
      mode: GameMode.computer,
      endlessMode: state.endlessMode,
    );

    if (firstPlayer == Player.two) {
      await addComputerMove();
    }
  }

  bool changeEndlessMode(bool endlessModeValue) {
    state = state.copyWith(endlessMode: endlessModeValue);

    return (state.board.contains(TileState.one) ||
        state.board.contains(TileState.two));
  }

  Future<void> _updateStats() async {
    ref.read(statsNotifierProvider.notifier).updateAfterGame(
      winner: state.winner,
      mode: state.mode,
      endlessEnabled: state.endlessMode,
    );
  }
}

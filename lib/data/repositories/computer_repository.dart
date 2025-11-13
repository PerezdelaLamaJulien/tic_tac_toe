import 'dart:math';

import 'package:tic_tac_toe/data/models/player.dart';
import 'package:tic_tac_toe/data/models/tile_state.dart';


class ComputerRepository {
  int chooseMove(List<TileState> board, Player computerPlayer) {
    int bestMove = _detectOptimalMoves(board, computerPlayer);
    if (bestMove != -1) {
      return bestMove;
    } else {
      final available = <int>[];
      for (int i = 0; i < board.length; i++) {
        if (board[i] == TileState.empty) available.add(i);
      }

      int result = available[Random().nextInt(available.length)];
      return result;
    }
  }

  int _detectOptimalMoves(List<TileState> board, Player computerPlayer) {
    final wins = {
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    };

    for (var combo in wins) {
      final firstTile = board[combo[0]],
          secondTile = board[combo[1]],
          thirdTile = board[combo[2]];
      //detect possible wins
      if (firstTile == computerPlayer.ownedTileState && (firstTile == secondTile || firstTile == thirdTile)) {
        if (secondTile != computerPlayer.ownedTileState && secondTile == TileState.empty) {
          return combo[1];
        } else if (thirdTile != computerPlayer.ownedTileState &&
            thirdTile == TileState.empty) {
          return combo[2];
        }
      }
      //detect possible loses
      if (firstTile == computerPlayer.opponentTileState && (firstTile == secondTile || firstTile == thirdTile)) {
        if (secondTile != computerPlayer.opponentTileState && secondTile == TileState.empty) {
          return combo[1];
        } else if (thirdTile != computerPlayer.opponentTileState &&
            thirdTile == TileState.empty) {
          return combo[2];
        }
      }
    }
    return -1;
  }
}

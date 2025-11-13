import 'package:mockito/annotations.dart';
import 'package:tic_tac_toe/data/models/game_mode.dart';
import 'package:tic_tac_toe/data/models/game_state.dart';
import 'package:tic_tac_toe/data/models/player.dart';
import 'package:tic_tac_toe/data/models/tile_state.dart';
import 'package:tic_tac_toe/data/models/winning_line_state.dart';
import 'package:tic_tac_toe/data/repositories/computer_repository.dart';
import 'package:tic_tac_toe/data/repositories/stats_repository.dart';
import 'package:tic_tac_toe/presentation/l10n/app_localizations.dart';

@GenerateNiceMocks( [
  MockSpec<ComputerRepository>(as: #MockComputerRepository),
  MockSpec<StatsRepository>(as: #MockStatsRepository),
  MockSpec<AppLocalizations>(as: #MockAppLocalizations),
])
class MockFactory {
  GameState drawGameState = GameState(
    board: [
      TileState.one,
      TileState.two,
      TileState.one,
      TileState.one,
      TileState.one,
      TileState.two,
      TileState.two,
      TileState.one,
      TileState.two,
    ],
    movesHistory: [],
    endlessMode: false,
    currentPlayer: Player.two,
    mode: GameMode.local,
    isDraw: true,
    hasBegun: true,
    winner: null,
    winningLineState: null,
    winningLine: null,
  );

  GameState oneWonGameState = GameState(
    board: [
      TileState.one,
      TileState.two,
      TileState.two,
      TileState.one,
      TileState.one,
      TileState.two,
      TileState.one,
      TileState.empty,
      TileState.two,
    ],
    movesHistory: [],
    endlessMode: false,
    currentPlayer: Player.two,
    mode: GameMode.local,
    isDraw: false,
    hasBegun: true,
    winner: Player.one,
    winningLineState: WinningLineState.vert,
    winningLine: [0, 3, 6],
  );

  GameState twoWonGameState = GameState(
    board: [
      TileState.two,
      TileState.two,
      TileState.two,
      TileState.one,
      TileState.one,
      TileState.two,
      TileState.one,
      TileState.one,
      TileState.two,
    ],
    movesHistory: [],
    endlessMode: false,
    currentPlayer: Player.one,
    mode: GameMode.local,
    isDraw: false,
    hasBegun: true,
    winner: Player.two,
    winningLineState: WinningLineState.hori,
    winningLine: [0, 1, 2],
  );

  GameState onGoingGameState = GameState(
    board: [
      TileState.empty,
      TileState.empty,
      TileState.one,
      TileState.empty,
      TileState.empty,
      TileState.two,
      TileState.empty,
      TileState.empty,
      TileState.empty,
    ],
    movesHistory: [],
    endlessMode: false,
    currentPlayer: Player.one,
    mode: GameMode.local,
    isDraw: false,
    hasBegun: true,
    winner: null,
    winningLineState: null,
    winningLine: null,
  );
}

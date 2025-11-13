import 'dart:math';

import 'package:tic_tac_toe/data/models/game_mode.dart';
import 'package:tic_tac_toe/data/models/player.dart';

class GameStats {
  final int totalGames;
  final int totalGamesComputer;
  final int totalGamesLocal;
  final int totalGamesWithEndless;
  final int winsPlayerOneLocal;
  final int winsPlayerTwoLocal;
  final int winsPlayerVersusComputer;
  final int draws;
  final int bestWinStreak;
  final int currentWinStreak;

  const GameStats({
    required this.totalGames,
    required this.totalGamesComputer,
    required this.totalGamesLocal,
    required this.totalGamesWithEndless,
    required this.winsPlayerOneLocal,
    required this.winsPlayerTwoLocal,
    required this.winsPlayerVersusComputer,
    required this.draws,
    required this.bestWinStreak,
    required this.currentWinStreak,
  });

  factory GameStats.initial() => const GameStats(
    totalGames: 0,
    totalGamesComputer: 0,
    totalGamesLocal: 0,
    totalGamesWithEndless: 0,
    winsPlayerOneLocal: 0,
    winsPlayerTwoLocal: 0,
    winsPlayerVersusComputer: 0,
    draws: 0,
    bestWinStreak: 0,
    currentWinStreak: 0,
  );

  factory GameStats.demo() => const GameStats(
    totalGames: 45,
    totalGamesComputer: 14,
    totalGamesLocal: 31,
    totalGamesWithEndless: 32,
    winsPlayerOneLocal: 14,
    winsPlayerTwoLocal: 3,
    winsPlayerVersusComputer: 12,
    draws: 9,
    bestWinStreak: 7,
    currentWinStreak: 2,
  );

  GameStats update(Player? winner, GameMode mode, bool endlessEnabled) {
    if (winner == null) {
      return copyWith(
        totalGames: totalGames + 1,
        totalGamesWithEndless: totalGamesWithEndless + (endlessEnabled ? 1 : 0),
        draws: draws + 1,
        currentWinStreak: 0,
      );
    }

    if (mode == GameMode.computer) {
      final isPlayer = winner == Player.one;
      final newWinStreak = isPlayer ? currentWinStreak + 1 : 0;

      return copyWith(
        totalGames: totalGames + 1,
        totalGamesComputer: totalGamesComputer + 1,
        winsPlayerVersusComputer: winsPlayerVersusComputer + (isPlayer ? 1 : 0),
        bestWinStreak: max(bestWinStreak, newWinStreak),
        currentWinStreak: newWinStreak,
      );
    } else {
      final isPlayerOne = winner == Player.one;
      final newWinStreak = isPlayerOne ? currentWinStreak + 1 : 0;

      return copyWith(
        totalGames: totalGames + 1,
        winsPlayerOneLocal: winsPlayerOneLocal + (isPlayerOne ? 1 : 0),
        winsPlayerTwoLocal: winsPlayerTwoLocal + (isPlayerOne ? 0 : 1),
        bestWinStreak: max(bestWinStreak, newWinStreak),
        currentWinStreak: newWinStreak,
      );
    }
  }

  Map<String, dynamic> toJson() => {
    'totalGames': totalGames,
    'totalGamesComputer': totalGamesComputer,
    'totalGamesLocal': totalGamesLocal,
    'totalGamesWithEndless': totalGamesWithEndless,
    'winsPlayerOneLocal': winsPlayerOneLocal,
    'winsPlayerTwoLocal': winsPlayerTwoLocal,
    'draws': draws,
    'bestWinStreak': bestWinStreak,
    'currentWinStreak': currentWinStreak,
  };

  factory GameStats.fromJson(Map<String, dynamic> json) => GameStats(
    totalGames: json['totalGames'] ?? 0,
    totalGamesComputer: json['totalGamesComputer'] ?? 0,
    totalGamesLocal: json['totalGamesLocal'] ?? 0,
    totalGamesWithEndless: json['totalGamesWithEndless'] ?? 0,
    winsPlayerOneLocal: json['winsPlayerOneLocal'] ?? 0,
    winsPlayerTwoLocal: json['winsPlayerTwoLocal'] ?? 0,
    winsPlayerVersusComputer: json['winsPlayerVersusComputer'] ?? 0,
    draws: json['draws'] ?? 0,
    bestWinStreak: json['bestWinStreak'] ?? 0,
    currentWinStreak: json['currentWinStreak'] ?? 0,
  );

  GameStats copyWith({
    int? totalGames,
    int? totalGamesComputer,
    int? totalGamesLocal,
    int? totalGamesWithEndless,
    int? winsPlayerOneLocal,
    int? winsPlayerTwoLocal,
    int? winsPlayerVersusComputer,
    int? draws,
    int? bestWinStreak,
    int? currentWinStreak,
  }) => GameStats(
    totalGames: totalGames ?? this.totalGames,
    totalGamesComputer: totalGamesComputer ?? this.totalGamesComputer,
    totalGamesLocal: totalGamesLocal ?? this.totalGamesLocal,
    totalGamesWithEndless: totalGamesWithEndless ?? this.totalGamesWithEndless,
    winsPlayerOneLocal: winsPlayerOneLocal ?? this.winsPlayerOneLocal,
    winsPlayerTwoLocal: winsPlayerTwoLocal ?? this.winsPlayerTwoLocal,
    winsPlayerVersusComputer:
        winsPlayerVersusComputer ?? this.winsPlayerVersusComputer,
    draws: draws ?? this.draws,
    bestWinStreak: bestWinStreak ?? this.bestWinStreak,
    currentWinStreak: currentWinStreak ?? this.currentWinStreak,
  );
}

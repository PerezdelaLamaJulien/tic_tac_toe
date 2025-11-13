import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/game/models/game_mode.dart';
import 'package:tic_tac_toe/game/models/game_stats.dart';
import 'package:tic_tac_toe/game/models/player.dart';
import 'package:tic_tac_toe/game/providers/stats_repository_provider.dart';

class StatsNotifier extends AsyncNotifier<GameStats> {
  @override
  Future<GameStats> build() async {
    final repo = ref.read(statsRepositoryProvider);
    final data = await repo.loadStats();
    return GameStats.fromJson(data);
  }

  Future<void> updateAfterGame({
    required GameMode mode,
    required Player? winner,
    required bool endlessEnabled,
  }) async {
    if (state.isLoading) return;
    final repo = ref.read(statsRepositoryProvider);
    final updated = state.value!.update(winner, mode, endlessEnabled);

    state = AsyncData(updated);
    await repo.saveStats(updated.toJson());
  }

  Future<void> reset() async {
    final repo = ref.read(statsRepositoryProvider);
    final cleared = GameStats.initial();
    state = AsyncData(cleared);
    await repo.saveStats(cleared.toJson());
  }

  Future<void> applyDemoStats() async {
    final repo = ref.read(statsRepositoryProvider);
    final demo = GameStats.demo();
    state = AsyncData(demo);
    await repo.saveStats(demo.toJson());
  }
}

final statsNotifierProvider = AsyncNotifierProvider<StatsNotifier, GameStats>(
  StatsNotifier.new,
);

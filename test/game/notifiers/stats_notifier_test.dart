import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tic_tac_toe/game/models/game_mode.dart';
import 'package:tic_tac_toe/game/models/game_stats.dart';
import 'package:tic_tac_toe/game/models/player.dart';
import 'package:tic_tac_toe/game/notifiers/stats_notifier.dart';
import 'package:tic_tac_toe/game/providers/stats_repository_provider.dart';

import 'game_notifier_test.mocks.dart';

void main() {
  test('initial state is correctly loaded after loading state', () async {
    final mockStatsRepository = MockStatsRepository();
    when(mockStatsRepository.loadStats())
        .thenAnswer((_) async => GameStats.initial().toJson());

    final container = ProviderContainer.test(
      overrides: [statsRepositoryProvider.overrideWith((ref) =>mockStatsRepository)],
    );
    var state = container.read(statsNotifierProvider);
    expect(state.isLoading, true);
    await container.read(statsNotifierProvider.future);
    state = container.read(statsNotifierProvider);
    expect(state.isLoading, false);
    expect(state.value, isNotNull);
  });

  test('repository is correctly called and with try to update', () async {
    final mockStatsRepository = MockStatsRepository();
    when(mockStatsRepository.loadStats())
        .thenAnswer((_) async => GameStats.initial().toJson());
    when(mockStatsRepository.saveStats(any))
        .thenAnswer((_) async {});

    final container = ProviderContainer.test(
      overrides: [statsRepositoryProvider.overrideWith((ref) =>mockStatsRepository)],
    );
    var state = container.read(statsNotifierProvider);
    expect(state.isLoading, true);
    await container.read(statsNotifierProvider.future);
    await container.read(statsNotifierProvider.notifier).updateAfterGame(
      mode: GameMode.local,
      winner: Player.one,
      endlessEnabled: true,
    );

    verify(mockStatsRepository.saveStats(any)).called(1);
  });

  test('repository is correctly called when try to update', () async {
    final mockStatsRepository = MockStatsRepository();
    when(mockStatsRepository.loadStats())
        .thenAnswer((_) async => GameStats.initial().toJson());
    when(mockStatsRepository.saveStats(any))
        .thenAnswer((_) async {});

    final container = ProviderContainer.test(
      overrides: [statsRepositoryProvider.overrideWith((ref) =>mockStatsRepository)],
    );
    var state = container.read(statsNotifierProvider);
    expect(state.isLoading, true);
    await container.read(statsNotifierProvider.future);
    await container.read(statsNotifierProvider.notifier).updateAfterGame(
      mode: GameMode.local,
      winner: Player.one,
      endlessEnabled: true,
    );

    verify(mockStatsRepository.saveStats(any)).called(1);
  });

  test('repository is correctly called when reset', () async {
    final mockStatsRepository = MockStatsRepository();
    when(mockStatsRepository.loadStats())
        .thenAnswer((_) async => GameStats.initial().toJson());
    when(mockStatsRepository.saveStats(any))
        .thenAnswer((_) async {});

    final container = ProviderContainer.test(
      overrides: [
        statsRepositoryProvider.overrideWith((ref) => mockStatsRepository)
      ],
    );
    var state = container.read(statsNotifierProvider);
    expect(state.isLoading, true);
    await container.read(statsNotifierProvider.future);
    await container.read(statsNotifierProvider.notifier).reset();

    verify(mockStatsRepository.saveStats(any)).called(1);
  });

  test('repository is correctly called when applyDemoStats', () async {
    final mockStatsRepository = MockStatsRepository();
    when(mockStatsRepository.loadStats())
        .thenAnswer((_) async => GameStats.initial().toJson());
    when(mockStatsRepository.saveStats(any))
        .thenAnswer((_) async {});

    final container = ProviderContainer.test(
      overrides: [statsRepositoryProvider.overrideWith((ref) =>mockStatsRepository)],
    );
    var state = container.read(statsNotifierProvider);
    expect(state.isLoading, true);
    await container.read(statsNotifierProvider.future);
    await container.read(statsNotifierProvider.notifier).applyDemoStats();

    verify(mockStatsRepository.saveStats(any)).called(1);
  });
}
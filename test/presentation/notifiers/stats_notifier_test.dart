import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tic_tac_toe/data/models/game_mode.dart';
import 'package:tic_tac_toe/data/models/game_stats.dart';
import 'package:tic_tac_toe/data/models/player.dart';
import 'package:tic_tac_toe/data/providers/stats_repository_provider.dart';
import 'package:tic_tac_toe/presentation/providers/stats_provider.dart';

import '../../mock_factory.mocks.dart';

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

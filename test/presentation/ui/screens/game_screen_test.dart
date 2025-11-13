import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tic_tac_toe/data/models/game_stats.dart';
import 'package:tic_tac_toe/data/providers/stats_repository_provider.dart';
import 'package:tic_tac_toe/presentation/providers/stats_provider.dart';
import 'package:tic_tac_toe/presentation/ui/screens/game_screen.dart';
import 'package:tic_tac_toe/presentation/ui/screens/stats_screen.dart';
import 'package:tic_tac_toe/presentation/ui/widgets/board_game.dart';
import 'package:tic_tac_toe/presentation/ui/widgets/coin_flip.dart';

import '../../../mock_factory.mocks.dart';


void main() {
  testWidgets('Game Screen is correctly shown', (tester) async {
    await tester.pumpWidget(
      ProviderScope(child: MaterialApp(home: GameScreen())),
    );

    expect(find.text("Tic Tac Toe"), findsOne);
    expect(find.byType(OrientationBuilder), findsOne);
    expect(find.byType(BoardGame), findsOne);
    expect(find.byType(Dialog), findsNothing);
    expect(find.byType(CoinFlip), findsNothing);

    await tester.tap(find.text("Jouer contre un ordinateur"));
    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsOne);
    expect(find.byType(CoinFlip), findsOne);
  });

  testWidgets('Can navigate to StatsScreen', (tester) async {
    final mockStatsRepository = MockStatsRepository();
    when(
      mockStatsRepository.loadStats(),
    ).thenAnswer((_) async => GameStats.initial().toJson());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          statsRepositoryProvider.overrideWith((ref) => mockStatsRepository),
        ],
        child: MaterialApp(home: GameScreen()),
      ),
    );

    expect(find.byIcon(Icons.query_stats), findsOne);
    await tester.tap(find.byIcon(Icons.query_stats));
    await tester.container().read(statsNotifierProvider.future);
    await tester.pumpAndSettle();
    expect(find.byType(StatsScreen), findsOne);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tic_tac_toe/data/models/game_stats.dart';
import 'package:tic_tac_toe/data/providers/stats_repository_provider.dart';
import 'package:tic_tac_toe/presentation/l10n/app_localizations.dart';
import 'package:tic_tac_toe/presentation/ui/screens/stats_screen.dart';

import '../../../mock_factory.mocks.dart';

void main() {
  testWidgets('Stats Screen is correctly shown', (tester) async {
    final mockStatsRepository = MockStatsRepository();
    when(
      mockStatsRepository.loadStats(),
    ).thenAnswer((_) async => GameStats.initial().toJson());
    when(mockStatsRepository.saveStats(any)).thenAnswer((_) async {});

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          statsRepositoryProvider.overrideWith((ref) => mockStatsRepository),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale('fr'),
          home: StatsScreen(),
        ),
      ),
    );

    expect(find.text("Statistiques"), findsOne);
    expect(find.byIcon(Icons.refresh), findsOne);
    expect(find.byIcon(Icons.add_chart), findsOne);
    expect(find.byType(CircularProgressIndicator), findsOne);

    await tester.pumpAndSettle();
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.widgetWithText(StatRow, "Parties jouées"), findsOne);
    expect(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is StatRow &&
            widget.label == 'Parties jouées' &&
            widget.value == 0,
      ),
      findsOneWidget,
    );

    await tester.tap(find.byIcon(Icons.add_chart));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOne);
    expect(find.text('Ajouter les données de demo ?'), findsOne);
    expect(find.text('Annuler'), findsOne);
    expect(find.text('Confirmer'), findsOne);
    await tester.tap(find.text('Confirmer'));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsNothing);
    expect(find.text('Ajouter les données de demo ?'), findsNothing);
    expect(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is StatRow &&
            widget.label == 'Parties jouées' &&
            widget.value == 45,
      ),
      findsOneWidget,
    );

    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOne);
    expect(find.text('Réinitialiser ?'), findsOne);
    expect(find.text('Annuler'), findsOne);
    expect(find.text('Confirmer'), findsOne);
    await tester.tap(find.text('Confirmer'));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsNothing);
    expect(find.text('Réinitialiser ?'), findsNothing);
    expect(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is StatRow &&
            widget.label == 'Parties jouées' &&
            widget.value == 0,
      ),
      findsOneWidget,
    );
  });
}

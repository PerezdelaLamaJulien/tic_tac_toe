import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/data/models/game_mode.dart';
import 'package:tic_tac_toe/presentation/ui/widgets/game_controls_panel.dart';

void main() {
  testWidgets('Can launch the game and change mode', (tester) async {
    late GameMode selectedGameMode;
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Material(
            child: GameControlsPanel(
              onStartGame: (mode) => selectedGameMode = mode,
              onRestartGame: () => {},
            ),
          ),
        ),
      ),
    );

    expect(find.text("Jouer contre un ordinateur"), findsOne);
    expect(find.text("Jouer contre un ami en local"), findsOne);
    expect(find.text("Endless Mode"), findsOne);
    expect(find.byType(Switch), findsOne);
    expect(find.byType(IconButton), findsOne);
    expect(find.text("Rejouer"), findsNothing);

    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsOne);
    expect(find.text("OK"), findsOne);
    await tester.tap(find.text("OK"));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(Switch));
    await tester.tap(find.text("Jouer contre un ordinateur"));
    await tester.pumpAndSettle();
    expect(selectedGameMode, GameMode.computer);

    await tester.tap(find.text("Jouer contre un ami en local"));
    await tester.pumpAndSettle();
    expect(selectedGameMode, GameMode.local);
  });
}

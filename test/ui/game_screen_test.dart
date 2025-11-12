import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/ui/board_game.dart';
import 'package:tic_tac_toe/ui/coin_flip.dart';
import 'package:tic_tac_toe/ui/game_screen.dart';

void main() {

  testWidgets('Screen is correctly shown', (tester) async {
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
}

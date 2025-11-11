import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/game/models/player.dart';
import 'package:tic_tac_toe/ui/coin_flip.dart';

void main() {
  testWidgets('Coin Flip show and interact correctly', (tester) async {
    late Player result;
    await tester.pumpWidget(
      MaterialApp(home: CoinFlip(onResult: (winner) => result = winner)),
    );
    expect(find.byType(Transform), findsOne);
    expect(find.byType(ElevatedButton), findsOne);
    await tester.tap(find.byType(ElevatedButton));

    await tester.pumpAndSettle();

    if (result == Player.one) {
      expect(find.text("X"), findsOne);
      expect(find.text("Le Joueur Bleu commence !"), findsOne);
    }
    if (result == Player.two) {
      expect(find.text("O"), findsOne);
      expect(find.text("Le Joueur Rouge commence !"), findsOne);
    }
  });
}

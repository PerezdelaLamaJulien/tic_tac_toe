import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/ui/board_game.dart';
import 'package:tic_tac_toe/ui/board_tile.dart';

void main() {
  testWidgets('BoardGame show GridView correctly', (tester) async {
    await tester.pumpWidget(
      ProviderScope(child: MaterialApp(home: BoardGame())),
    );
    expect(find.byType(GridView), findsOne);
    expect(find.byType(BoardTile), findsExactly(9));
  });
}

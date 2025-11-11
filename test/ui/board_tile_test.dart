import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/game/models/tile_state.dart';
import 'package:tic_tac_toe/game/models/winning_line_state.dart';
import 'package:tic_tac_toe/ui/board_tile.dart';

void main() {
  testWidgets('BoardTile displays nothing and cant be tapped because game has not begun', (tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: BoardTile(
          state: TileState.empty,
          onTap: () => tapped = true,
          isHighlighted: false,
          gameHasBegun: false,
          winningLineState: null,
        ),
      ),
    );

    expect(find.text('X'), findsNothing);
    expect(find.text('O'), findsNothing);
    await tester.tap(find.byType(BoardTile));
    expect(tapped, false);
  });

  testWidgets('BoardTile displays nothing and can be tapped', (tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: BoardTile(
          state: TileState.empty,
          onTap: () => tapped = true,
          isHighlighted: false,
          gameHasBegun: true,
          winningLineState: null,
        ),
      ),
    );

    expect(find.text('X'), findsNothing);
    expect(find.text('O'), findsNothing);
    await tester.tap(find.byType(BoardTile));
    expect(tapped, true);
  });

  testWidgets('BoardTile displays X and cant be tapped because tile is already filled', (tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: BoardTile(
          state: TileState.one,
          onTap: () => tapped = true,
          isHighlighted: false,
          gameHasBegun: true,
          winningLineState: null,
        ),
      ),
    );

    expect(find.text('X'), findsOne);
    expect(find.text('O'), findsNothing);
    await tester.tap(find.byType(BoardTile));
    expect(tapped, false);
  });

  testWidgets('BoardTile displays 0 and cant be tapped because tile is already filled', (tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: BoardTile(
          state: TileState.two,
          onTap: () => tapped = true,
          isHighlighted: false,
          gameHasBegun: true,
          winningLineState: null,
        ),
      ),
    );

    expect(find.text('X'), findsNothing);
    expect(find.text('O'), findsOne);
    await tester.tap(find.byType(BoardTile));
    expect(tapped, false);
  });

  testWidgets('Transform widget can be found if isHighlighted is true and winningLineState is not null', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BoardTile(
          state: TileState.two,
          onTap: () => {},
          isHighlighted: true,
          gameHasBegun: true,
          winningLineState: WinningLineState.hori,
        ),
      ),
    );

    expect(find.byType(Transform), findsOne);
  });
}

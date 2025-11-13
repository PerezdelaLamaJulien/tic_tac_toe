import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/data/models/tile_state.dart';

void main() {
  test('state one return good values', () {
    final state = TileState.one;
    expect(state.text, "X");
    expect(state.backgroundColor, Colors.indigo);
    expect(state.iconColor, Colors.blueAccent);
  });

  test('state two return good values', () {
    final state = TileState.two;
    expect(state.text, "O");
    expect(state.backgroundColor, Colors.red.shade700);
    expect(state.iconColor, Colors.redAccent);
  });

  test('state empty return good values', () {
    final state = TileState.empty;
    expect(state.text, "");
    expect(state.backgroundColor, Colors.transparent);
    expect(state.iconColor, Colors.transparent);
  });
}

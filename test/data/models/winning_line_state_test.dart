import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:tic_tac_toe/data/models/winning_line_state.dart';

void main() {
  test('state hori return good values', () {
    final state = WinningLineState.hori;
    expect(
      state.matrix4Transform(Orientation.portrait),
      Matrix4Transform().rotate(0 * 3.1415926 / 180).matrix4,
    );
    expect(
      state.matrix4Transform(Orientation.landscape),
      Matrix4Transform().rotate(0 * 3.1415926 / 180).matrix4,
    );
  });

  test('state vert return good values', () {
    final state = WinningLineState.vert;
    expect(
      state.matrix4Transform(Orientation.portrait),
      Matrix4Transform()
          .rotate(90 * 3.1415926 / 180)
          .translate(x: 65, y: -59)
          .matrix4,
    );
    expect(
      state.matrix4Transform(Orientation.landscape),
      Matrix4Transform()
          .rotate(90 * 3.1415926 / 180)
          .translate(x: 52, y: -45)
          .matrix4,
    );
  });

  test('state diagLR return good values', () {
    final state = WinningLineState.diagLR;
    expect(
      state.matrix4Transform(Orientation.portrait),
      Matrix4Transform()
          .rotate(45 * 3.1415926 / 180)
          .translate(x: 5, y: -60)
          .scaleHorizontally(1.38)
          .matrix4,
    );
    expect(
      state.matrix4Transform(Orientation.landscape),
      Matrix4Transform()
          .rotate(45 * 3.1415926 / 180)
          .scaleHorizontally(1.35)
          .translate(x: 5, y: -45)
          .matrix4,
    );
  });

  test('state diagRL return good values', () {
    final state = WinningLineState.diagRL;
    expect(
      state.matrix4Transform(Orientation.portrait),
      Matrix4Transform()
          .rotate(-45 * 3.1415926 / 180)
          .translate(x: 0, y: 60)
          .scaleHorizontally(1.38)
          .matrix4,
    );
    expect(
      state.matrix4Transform(Orientation.landscape),
      Matrix4Transform()
          .rotate(-45 * 3.1415926 / 180)
          .scaleHorizontally(1.35)
          .translate(x: 0, y: 48)
          .matrix4,
    );
  });
}

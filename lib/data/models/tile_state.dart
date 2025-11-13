import 'package:flutter/material.dart';

enum TileState { one, two, empty }

extension TileStateExtension on TileState {
  String get text {
    switch (this) {
      case TileState.one:
        return 'X';
      case TileState.two:
        return 'O';
      default:
        return '';
    }
  }

  Color get backgroundColor {
    switch (this) {
      case TileState.one:
        return Colors.indigo;
      case TileState.two:
        return Colors.red.shade700;
      default:
        return Colors.transparent;
    }
  }

  Color get iconColor {
    switch (this) {
      case TileState.one:
        return Colors.blueAccent;
      case TileState.two:
        return Colors.redAccent;
      default:
        return Colors.transparent;
    }
  }
}

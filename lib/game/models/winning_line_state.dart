import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:flutter/cupertino.dart';

enum WinningLineState { hori, vert, diagLR, diagRL }

extension WinningLineStateExtension on WinningLineState {
  Matrix4 matrix4Transform(Orientation orientation) {

    switch (this) {
      case WinningLineState.hori:
        return Matrix4Transform()
            .rotate(0 * 3.1415926 / 180)
            .matrix4;
      case WinningLineState.vert:
        if(orientation == Orientation.portrait){
          return Matrix4Transform()
              .rotate(90 * 3.1415926 / 180)
              .translate(x:65, y : -59)
              .matrix4;
        } else {
          return Matrix4Transform()
              .rotate(90 * 3.1415926 / 180)
              .translate(x:52, y : -45)
              .matrix4;
        }
      case WinningLineState.diagLR:
        if(orientation == Orientation.portrait){
          return Matrix4Transform()
              .rotate(45 * 3.1415926 / 180)
              .translate(x:5, y : -60)
              .scaleHorizontally(1.38)
              .matrix4;
        } else {
          return Matrix4Transform()
              .rotate(45 * 3.1415926 / 180)
              .scaleHorizontally(1.35)
              .translate(x:5, y : -45)
              .matrix4;
        }
      case WinningLineState.diagRL:
        if(orientation == Orientation.portrait){
          return Matrix4Transform()
              .rotate(-45 * 3.1415926 / 180)
              .translate(x:0, y : 60)
              .scaleHorizontally(1.38)
              .matrix4;
        } else {
          return Matrix4Transform()
              .rotate(-45 * 3.1415926 / 180)
              .scaleHorizontally(1.35)
              .translate(x:0, y : 48)
              .matrix4;
        }
    }
  }
}

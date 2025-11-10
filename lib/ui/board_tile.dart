import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game/models/tile_state.dart';
import 'package:tic_tac_toe/game/models/winning_line_state.dart';

class BoardTile extends StatelessWidget {
  final TileState state;
  final VoidCallback onTap;
  final bool isHighlighted;
  final bool gameHasBegun;
  final WinningLineState? winningLineState;

  const BoardTile({
    super.key,
    required this.state,
    required this.onTap,
    required this.gameHasBegun,
    this.isHighlighted = false,
    this.winningLineState,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameHasBegun && state == TileState.empty ? onTap : null,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 1.5),
              color: isHighlighted
                  ? state.backgroundColor.withAlpha(25)
                  : Colors.transparent,
            ),
            child: Center(
              child: Text(
                state.text,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: state.iconColor,
                ),
              ),
            ),
          ),

          if (isHighlighted && winningLineState != null)
            Transform(
              transform: winningLineState!.matrix4Transform(
                MediaQuery.of(context).orientation,
              ),
              child: Container(width: 200, height: 6, color: state.iconColor),
            ),
        ],
      ),
    );
  }
}

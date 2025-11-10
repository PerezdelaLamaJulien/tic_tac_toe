import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/game/game_notifier.dart';

import 'board_tile.dart';

class BoardGame extends ConsumerWidget {
  final Function() onStartGame;

  const BoardGame({super.key, required this.onStartGame});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameProvider);
    final controller = ref.read(gameProvider.notifier);

    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: GridView.builder(
            itemCount: 9,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              final isHighlighted = game.winningLine?.contains(index) ?? false;
              return BoardTile(
                state: game.board[index],
                onTap: () => controller.playMove(index),
                gameHasBegun: game.hasBegun,
                isHighlighted: isHighlighted,
                winningLineState: game.winningLineState,
              );
            },
          ),
        ),
        if (game.hasBegun == false)
          Positioned.fill(
            child: Center(
              child: ElevatedButton.icon(
                onPressed: onStartGame,
                icon: Icon(Icons.play_arrow),
                label: Text("Commencer"),
              ),
            ),
          ),
        if (game.winner != null || game.isDraw)
          Positioned.fill(
            child: Center(
              child: ElevatedButton.icon(
                onPressed: onStartGame,
                icon: Icon(Icons.refresh),
                label: Text("Rejouer"),
              ),
            ),
          ),
      ],
    );
  }
}

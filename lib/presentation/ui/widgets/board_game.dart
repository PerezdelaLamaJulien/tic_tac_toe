import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/presentation/providers/game_provider.dart';
import 'package:tic_tac_toe/presentation/ui/widgets/board_tile.dart';

class BoardGame extends ConsumerWidget {
  const BoardGame({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameProvider);
    final controller = ref.read(gameProvider.notifier);
    return AspectRatio(
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
            onTap: () => controller.addPlayerMove(index),
            gameHasBegun: game.hasBegun,
            isHighlighted: isHighlighted,
            isGoingToDisapparated: (game.endlessMode && game.movesHistory.length == 6 && game.movesHistory.first == index),
            winningLineState: game.winningLineState,
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/game/models/game_mode.dart';
import 'package:tic_tac_toe/game/providers/game_provider.dart';

class GameControlsPanel extends ConsumerWidget {
  const GameControlsPanel({
    super.key,
    required this.onStartGame,
    required this.onRestartGame,
  });

  final Function(GameMode) onStartGame;
  final Function() onRestartGame;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameProvider);
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        if (game.mode == GameMode.local || !game.hasBegun)
          ElevatedButton.icon(
            onPressed: () => {onStartGame(GameMode.computer)},
            icon: Icon(Icons.play_arrow),
            label: Text("Jouer contre un ordinateur"),
          ),
        if (game.mode == GameMode.computer || !game.hasBegun)
          ElevatedButton.icon(
            onPressed: () => {onStartGame(GameMode.local)},
            icon: Icon(Icons.play_arrow),
            label: Text("Jouer contre un ami en local"),
          ),
        if (game.winner != null || game.isDraw)
          ElevatedButton.icon(
            onPressed: () => {
              onRestartGame()
            },
            icon: Icon(Icons.refresh),
            label: Text("Rejouer"),
          ),
      ],
    );
  }
}

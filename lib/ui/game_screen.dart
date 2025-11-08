import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/game/game_notifier.dart';
import 'package:tic_tac_toe/game/models/player.dart';
import 'board_game.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameProvider);
    final controller = ref.read(gameProvider.notifier);

    String status;
    if (game.winner != null) {
      status = "Le ${game.winner!.playerName} a gagné 🎉";
    } else if (game.isDraw) {
      status = "Match nul 😐";
    } else {
      status = "Tour de ${game.currentPlayer.playerName}";
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Tic Tac Toe'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  Text(status, style: const TextStyle(fontSize: 24)),
                  BoardGame(),
                  ElevatedButton.icon(
                    onPressed: controller.reset,
                    icon: const Icon(Icons.refresh),
                    label: const Text("Rejouer"),
                  ),
                ],
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(child: BoardGame()),
                  SizedBox(
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                      children: [
                        Text(
                          status,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 24),
                        ),
                        ElevatedButton.icon(
                          onPressed: controller.reset,
                          icon: const Icon(Icons.refresh),
                          label: const Text("Rejouer"),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

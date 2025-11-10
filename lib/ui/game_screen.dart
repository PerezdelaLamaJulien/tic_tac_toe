import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/game/game_notifier.dart';
import 'package:tic_tac_toe/game/models/game_state.dart';
import 'package:tic_tac_toe/ui/coin_flip.dart';
import 'board_game.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameProvider);

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
                  Text(game.status, style: const TextStyle(fontSize: 24)),
                  BoardGame(
                    onStartGame: () => showCoinTossDialog(context, ref),
                  ),
                ],
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: BoardGame(
                      onStartGame: () => showCoinTossDialog(context, ref),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                      children: [
                        Text(
                          game.status,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 24),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => showCoinTossDialog(context, ref),
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

  Future<void> showCoinTossDialog(BuildContext context, WidgetRef ref) async {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: CoinFlip(
            onResult: (player) {
              ref.read(gameProvider.notifier).startGame(player);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

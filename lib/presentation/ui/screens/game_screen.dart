import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/data/models/game_mode.dart';
import 'package:tic_tac_toe/data/models/game_state.dart';
import 'package:tic_tac_toe/presentation/l10n/app_localizations.dart';
import 'package:tic_tac_toe/presentation/providers/game_provider.dart';
import 'package:tic_tac_toe/presentation/ui/screens/stats_screen.dart';
import 'package:tic_tac_toe/presentation/ui/widgets/coin_flip.dart';
import 'package:tic_tac_toe/presentation/ui/widgets/game_controls_panel.dart';

import '../widgets/board_game.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameProvider);
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.appTitle),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(builder: (context) => StatsScreen()),
              );
            },
            icon: Icon(Icons.query_stats),
          ),
        ],
        centerTitle: true,
      ), // actions
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  Text(game.status(localization), style: const TextStyle(fontSize: 24)),
                  BoardGame(),
                  Flexible(
                    child: GameControlsPanel(
                      onStartGame: (mode) => {
                        showCoinTossDialog(mode, context, ref),
                      },
                      onRestartGame: () => {
                        showCoinTossDialog(null, context, ref),
                      },
                    ),
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
                          game.status(localization),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 24),
                        ),
                        Flexible(
                          child: GameControlsPanel(
                            onStartGame: (mode) => {
                              showCoinTossDialog(mode, context, ref),
                            },
                            onRestartGame: () => {
                              showCoinTossDialog(null, context, ref),
                            },
                          ),
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

  Future<void> showCoinTossDialog(
    GameMode? mode,
    BuildContext context,
    WidgetRef ref,
  ) async {
    mode ??= ref.read(gameProvider).mode;
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: CoinFlip(
            onResult: (player) {
              switch (mode!) {
                case GameMode.local:
                  ref
                      .read(gameProvider.notifier)
                      .startGameAgainstLocalPlayer(player);
                case GameMode.computer:
                  ref
                      .read(gameProvider.notifier)
                      .startGameAgainstComputer(player);
              }
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

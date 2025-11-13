import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/data/models/game_mode.dart';
import 'package:tic_tac_toe/presentation/l10n/app_localizations.dart';
import 'package:tic_tac_toe/presentation/providers/game_provider.dart';

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
    final localization = AppLocalizations.of(context)!;
    final game = ref.watch(gameProvider);
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            if (game.mode == GameMode.local || !game.hasBegun)
              ElevatedButton.icon(
                onPressed: () => {onStartGame(GameMode.computer)},
                icon: Icon(Icons.play_arrow),
                label: Text(localization.gameControlsStartComputerActionLabel),
              ),
            if (game.mode == GameMode.computer || !game.hasBegun)
              ElevatedButton.icon(
                onPressed: () => {onStartGame(GameMode.local)},
                icon: Icon(Icons.play_arrow),
                label: Text(localization.gameControlsStartLocalActionLabel),
              ),
            if (game.winner != null || game.isDraw)
              ElevatedButton.icon(
                onPressed: () => {onRestartGame()},
                icon: Icon(Icons.refresh),
                label: Text(localization.gameControlsRestartActionLabel),
              ),
          ],
        ),

        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(localization.gameControlsEndlessModeTitle),
              Switch(
                value: game.endlessMode,
                onChanged: (newValue) => endlessModeOnChanged(newValue, ref),
              ),
              Flexible(
                child: IconButton(
                  onPressed: () => showEndlessDialog(context),
                  icon: Icon(Icons.help_outline),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void endlessModeOnChanged(bool newValue, WidgetRef ref) {
    var shouldRestartAndCoinFlip = ref
        .read(gameProvider.notifier)
        .changeEndlessMode(newValue);

    if (shouldRestartAndCoinFlip) {
      onRestartGame();
    }
  }

  Future<void> showEndlessDialog(BuildContext context) async {
    final localization = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              Text(
                localization.gameControlsEndlessModeTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                localization.gameControlsEndlessModeDialogText,
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text(localization.okActionLabel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

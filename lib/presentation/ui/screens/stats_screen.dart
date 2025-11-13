import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/data/models/game_stats.dart';
import 'package:tic_tac_toe/presentation/l10n/app_localizations.dart';
import 'package:tic_tac_toe/presentation/providers/stats_provider.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncStats = ref.watch(statsNotifierProvider);
    final statsNotifier = ref.read(statsNotifierProvider.notifier);
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.statsScreenTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: localization.refreshStatsDialogTooltip,
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(
                    localization.refreshStatsDialogTitle,
                  ),
                  content: Text(
                    localization.refreshStatsDialogText,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text(
                        localization.cancelActionLabel,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Text(
                        localization.confirmActionLabel,
                      ),
                    ),
                  ],
                ),
              );
              if (confirm == true) {
                await statsNotifier.reset();
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_chart),
            tooltip: localization.addDemoStatsDialogTooltip,
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(
                    localization.addDemoStatsDialogTitle,
                  ),
                  content: Text(
                    localization.addDemoStatsDialogText,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text(
                        localization.cancelActionLabel,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Text(
                        localization.confirmActionLabel,
                      ),
                    ),
                  ],
                ),
              );
              if (confirm == true) {
                await statsNotifier.applyDemoStats();
              }
            },
          ),
        ],
      ),
      body: asyncStats.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Text(
            localization.loadingErrorText(err.toString()),
          ),
        ),
        data: (stats) => Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localization.statsScreenPerformancesHeaderLabel,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              StatRow(
                label: localization.statsScreenTotalGamesRowLabel,
                value: stats.totalGames,
              ),
              StatRow(
                label: localization.statsScreenTotalGamesComputerRowLabel,
                value: stats.totalGamesComputer,
              ),
              StatRow(
                label: localization.statsScreenTotalGamesLocalRowLabel,
                value: stats.totalGamesLocal,
              ),
              StatRow(
                label: localization.statsScreenTotalGamesEndlessRowLabel,
                value: stats.totalGamesWithEndless,
              ),
              StatRow(
                label: localization.statsScreenVictoryPlayerOneRowLabel,
                value: stats.winsPlayerOneLocal,
              ),
              StatRow(
                label: localization.statsScreenVictoryPlayerTwoRowLabel,
                value: stats.winsPlayerTwoLocal,
              ),
              StatRow(
                label: localization.statsScreenVictoryVersusComputerRowLabel,
                value: stats.winsPlayerVersusComputer,
              ),
              StatRow(
                label: localization.statsScreenTotalDrawsRowLabel,
                value: stats.draws,
              ),
              const Divider(height: 32),
              StatRow(
                label: localization.statsScreenCurrentStreakRowLabel,
                value: stats.currentWinStreak,
              ),
              StatRow(
                label: localization.statsScreenBestStreakRowLabel,
                value: stats.bestWinStreak,
              ),
              const Spacer(),
              Center(
                child: Text(
                  _getMotivationMessage(stats, localization),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getMotivationMessage(GameStats stats, AppLocalizations localization) {
    if (stats.bestWinStreak >= 5) {
      return localization.statsScreenMotivationMessageBestStreakAboveFiveLabel;
    }
    if (stats.currentWinStreak >= 3) {
      return localization.statsScreenMotivationMessageCurrentStreakAboveThreeLabel;
    }
    if (stats.winsPlayerOneLocal +
            stats.winsPlayerTwoLocal +
            stats.winsPlayerVersusComputer ==
        0) {
      return localization.statsScreenMotivationStartFirstGameLabel;
    }
    return localization.statsScreenMotivationDefaultLabel;
  }
}

class StatRow extends StatelessWidget {
  final String label;
  final int value;

  const StatRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text(
            value.toString(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

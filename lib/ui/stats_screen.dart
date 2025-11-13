import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/game/models/game_stats.dart';
import 'package:tic_tac_toe/game/notifiers/stats_notifier.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncStats = ref.watch(statsNotifierProvider);
    final statsNotifier = ref.read(statsNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistiques'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Réinitialiser les statistiques',
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Réinitialiser ?'),
                  content: const Text(
                    'Voulez-vous vraiment remettre toutes les statistiques à zéro ?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Annuler'),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Confirmer'),
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
            tooltip: 'Ajouter les données de demo',
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Ajouter les données de demo ?'),
                  content: const Text(
                    'Voulez-vous rajouter des fausses données de démo? Vous allez perdre toutes les statistiques actuelles',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Annuler'),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Confirmer'),
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
        error: (err, stack) =>
            Center(child: Text('Erreur de chargement : $err')),
        data: (stats) => Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Vos performances',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              StatRow(label: 'Parties jouées', value: stats.totalGames),
              StatRow(
                label: 'Victoires Joueur Bleu en local',
                value: stats.winsPlayerOneLocal,
              ),
              StatRow(
                label: 'Victoires Joueur Rouge en local',
                value: stats.winsPlayerTwoLocal,
              ),
              StatRow(
                label: 'Victoires du Joueur contre l\'ordinateur',
                value: stats.winsPlayerVersusComputer,
              ),
              StatRow(label: 'Matchs nuls', value: stats.draws),
              const Divider(height: 32),
              StatRow(label: 'Série actuelle', value: stats.currentWinStreak),
              StatRow(label: 'Meilleure série', value: stats.bestWinStreak),
              const Spacer(),
              Center(
                child: Text(
                  _getMotivationMessage(stats),
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

  String _getMotivationMessage(GameStats stats) {
    if (stats.bestWinStreak >= 5) return '🔥 Série légendaire !';
    if (stats.currentWinStreak >= 3) return '💪 Continue sur ta lancée !';
    if (stats.winsPlayerOneLocal +
            stats.winsPlayerTwoLocal +
            stats.winsPlayerVersusComputer ==
        0)
      return '🕹️ Commence ta première partie !';
    return 'Bonne chance pour la prochaine partie !';
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

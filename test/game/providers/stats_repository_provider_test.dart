import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_toe/game/models/game_stats.dart';
import 'package:tic_tac_toe/game/providers/stats_repository_provider.dart';

void main() {
  test('saveStats & load', () async {
    SharedPreferences.setMockInitialValues({});
    final repository = StatsRepository();
    await repository.saveStats(GameStats.demo().toJson());
    final data = await repository.loadStats();
    final gameStats = GameStats.fromJson(data);
    expect(gameStats.totalGames, 45);
  });
}

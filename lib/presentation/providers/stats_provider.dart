import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/data/models/game_stats.dart';
import 'package:tic_tac_toe/presentation/notifiers/stats_notifier.dart';

final statsNotifierProvider = AsyncNotifierProvider<StatsNotifier, GameStats>(
  StatsNotifier.new,
);

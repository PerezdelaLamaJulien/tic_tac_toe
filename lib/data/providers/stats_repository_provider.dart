import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/data/repositories/stats_repository.dart';

final statsRepositoryProvider = Provider<StatsRepository>((ref) {
  return StatsRepository();
});


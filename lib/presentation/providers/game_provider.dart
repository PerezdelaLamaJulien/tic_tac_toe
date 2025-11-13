import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/data/models/game_state.dart';
import 'package:tic_tac_toe/presentation/notifiers/game_notifier.dart';

final gameProvider = NotifierProvider<GameNotifier, GameState>(GameNotifier.new);

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/game/models/game_state.dart';
import 'package:tic_tac_toe/game/notifiers/game_notifier.dart';

final gameProvider = NotifierProvider<GameNotifier, GameState>(GameNotifier.new);

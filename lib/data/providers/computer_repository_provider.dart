import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/data/repositories/computer_repository.dart';

final computerRepositoryProvider = Provider<ComputerRepository>((ref) => ComputerRepository());


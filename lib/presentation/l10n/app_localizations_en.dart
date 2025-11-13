// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Tic Tac Toe';

  @override
  String get statsScreenTitle => 'Statistics';

  @override
  String get refreshStatsDialogTooltip => 'Reset statistics';

  @override
  String get refreshStatsDialogTitle => 'Reset?';

  @override
  String get refreshStatsDialogText =>
      'Are you sure you want to reset all your statistics?';

  @override
  String get cancelActionLabel => 'Cancel';

  @override
  String get confirmActionLabel => 'Confirm';

  @override
  String get addDemoStatsDialogTooltip => 'Add demo data';

  @override
  String get addDemoStatsDialogTitle => 'Add demo data?';

  @override
  String get addDemoStatsDialogText =>
      'Do you want to add fake demo data? All current statistics will be lost.';

  @override
  String loadingErrorText(String err) {
    return 'Loading error: $err';
  }

  @override
  String get statsScreenPerformancesHeaderLabel => 'Your performances';

  @override
  String get statsScreenTotalGamesRowLabel => 'Games played';

  @override
  String get statsScreenTotalGamesComputerRowLabel =>
      'Games played against the computer';

  @override
  String get statsScreenTotalGamesLocalRowLabel => 'Games played locally';

  @override
  String get statsScreenTotalGamesEndlessRowLabel =>
      'Games played in Endless mode';

  @override
  String get statsScreenVictoryPlayerOneRowLabel => 'Blue Player wins locally';

  @override
  String get statsScreenVictoryPlayerTwoRowLabel => 'Red Player wins locally';

  @override
  String get statsScreenVictoryVersusComputerRowLabel =>
      'Player wins against the computer';

  @override
  String get statsScreenTotalDrawsRowLabel => 'Draws';

  @override
  String get statsScreenCurrentStreakRowLabel => 'Current streak';

  @override
  String get statsScreenBestStreakRowLabel => 'Best streak';

  @override
  String get statsScreenMotivationMessageBestStreakAboveFiveLabel =>
      '🔥 Legendary streak!';

  @override
  String get statsScreenMotivationMessageCurrentStreakAboveThreeLabel =>
      '💪 Keep up the momentum!';

  @override
  String get statsScreenMotivationStartFirstGameLabel =>
      '🕹️ Start your first game!';

  @override
  String get statsScreenMotivationDefaultLabel =>
      'Good luck for the next game!';

  @override
  String get coinFlipStartButtonLabel => 'Flip the coin';

  @override
  String coinFlipResultLabel(String playerName) {
    return '\$$playerName starts!';
  }

  @override
  String get gameControlsStartComputerActionLabel =>
      'Play against the computer';

  @override
  String get gameControlsStartLocalActionLabel =>
      'Play against a friend locally';

  @override
  String get gameControlsRestartActionLabel => 'Play again';

  @override
  String get gameControlsEndlessModeTitle => 'Endless Mode';

  @override
  String get gameControlsEndlessModeDialogText =>
      'Symbols gradually disappear as the game progresses. No draws are possible — the game only ends when a player aligns three symbols.';

  @override
  String get okActionLabel => 'OK';

  @override
  String gameExtensionStatusWinner(String playerName) {
    return '\$$playerName won 🎉';
  }

  @override
  String get gameExtensionStatusDraw => 'Draw 😐';

  @override
  String get gameExtensionStatusDefault => 'Who will be the best?';

  @override
  String gameExtensionStatusTurnPlayer(String playerName) {
    return '\$$playerName\'s turn';
  }

  @override
  String get playerOneExtensionName => 'Blue Player';

  @override
  String get playerTwoExtensionName => 'Red Player';
}

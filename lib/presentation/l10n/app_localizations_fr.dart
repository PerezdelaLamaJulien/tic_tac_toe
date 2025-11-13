// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Tic Tac Toe';

  @override
  String get statsScreenTitle => 'Statistiques';

  @override
  String get refreshStatsDialogTooltip => 'Réinitialiser les statistiques';

  @override
  String get refreshStatsDialogTitle => 'Réinitialiser ?';

  @override
  String get refreshStatsDialogText =>
      'Voulez-vous vraiment remettre toutes les statistiques à zéro ?';

  @override
  String get cancelActionLabel => 'Annuler';

  @override
  String get confirmActionLabel => 'Confirmer';

  @override
  String get addDemoStatsDialogTooltip => 'Ajouter les données de demo';

  @override
  String get addDemoStatsDialogTitle => 'Ajouter les données de demo ?';

  @override
  String get addDemoStatsDialogText =>
      'Voulez-vous rajouter des fausses données de démo? Vous allez perdre toutes les statistiques actuelles';

  @override
  String loadingErrorText(String err) {
    return 'Erreur de chargement : $err';
  }

  @override
  String get statsScreenPerformancesHeaderLabel => 'Vos performances';

  @override
  String get statsScreenTotalGamesRowLabel => 'Parties jouées';

  @override
  String get statsScreenTotalGamesComputerRowLabel =>
      'Parties jouées contre l\'ordinateur';

  @override
  String get statsScreenTotalGamesLocalRowLabel => 'Parties jouées en local';

  @override
  String get statsScreenTotalGamesEndlessRowLabel =>
      'Parties jouées avec le mode Endless';

  @override
  String get statsScreenVictoryPlayerOneRowLabel =>
      'Victoires Joueur Bleu en local';

  @override
  String get statsScreenVictoryPlayerTwoRowLabel =>
      'Victoires Joueur Rouge en local';

  @override
  String get statsScreenVictoryVersusComputerRowLabel =>
      'Victoires du Joueur contre l\'ordinateur';

  @override
  String get statsScreenTotalDrawsRowLabel => 'Matchs nuls';

  @override
  String get statsScreenCurrentStreakRowLabel => 'Série actuelle';

  @override
  String get statsScreenBestStreakRowLabel => 'Meilleure série';

  @override
  String get statsScreenMotivationMessageBestStreakAboveFiveLabel =>
      '🔥 Série légendaire !';

  @override
  String get statsScreenMotivationMessageCurrentStreakAboveThreeLabel =>
      '💪 Continue sur ta lancée !';

  @override
  String get statsScreenMotivationStartFirstGameLabel =>
      '️🕹️ Commence ta première partie !';

  @override
  String get statsScreenMotivationDefaultLabel =>
      '️Bonne chance pour la prochaine partie !';

  @override
  String get coinFlipStartButtonLabel => '️Lancer la pièce';

  @override
  String coinFlipResultLabel(String playerName) {
    return 'Le $playerName commence !';
  }

  @override
  String get gameControlsStartComputerActionLabel =>
      'Jouer contre un ordinateur';

  @override
  String get gameControlsStartLocalActionLabel =>
      'Jouer contre un ami en local';

  @override
  String get gameControlsRestartActionLabel => 'Rejouer';

  @override
  String get gameControlsEndlessModeTitle => 'Endless Mode';

  @override
  String get gameControlsEndlessModeDialogText =>
      'Les symboles disparaissent petit à petit que la partie avance. Pas d\'égalité possible, la partie ne s\'arrête que quand un joueur aura aligné 3 symboles.';

  @override
  String get okActionLabel => 'OK';

  @override
  String gameExtensionStatusWinner(String playerName) {
    return 'Le $playerName a gagné 🎉';
  }

  @override
  String get gameExtensionStatusDraw => 'Match nul 😐';

  @override
  String get gameExtensionStatusDefault => 'Qui seras le meilleur ?';

  @override
  String gameExtensionStatusTurnPlayer(String playerName) {
    return 'Tour de $playerName';
  }

  @override
  String get playerOneExtensionName => 'Joueur Bleu';

  @override
  String get playerTwoExtensionName => 'Joueur Rouge';
}

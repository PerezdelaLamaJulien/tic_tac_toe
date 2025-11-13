import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Tic Tac Toe'**
  String get appTitle;

  /// No description provided for @statsScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statsScreenTitle;

  /// No description provided for @refreshStatsDialogTooltip.
  ///
  /// In en, this message translates to:
  /// **'Reset statistics'**
  String get refreshStatsDialogTooltip;

  /// No description provided for @refreshStatsDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset?'**
  String get refreshStatsDialogTitle;

  /// No description provided for @refreshStatsDialogText.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reset all your statistics?'**
  String get refreshStatsDialogText;

  /// No description provided for @cancelActionLabel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelActionLabel;

  /// No description provided for @confirmActionLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmActionLabel;

  /// No description provided for @addDemoStatsDialogTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add demo data'**
  String get addDemoStatsDialogTooltip;

  /// No description provided for @addDemoStatsDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Add demo data?'**
  String get addDemoStatsDialogTitle;

  /// No description provided for @addDemoStatsDialogText.
  ///
  /// In en, this message translates to:
  /// **'Do you want to add fake demo data? All current statistics will be lost.'**
  String get addDemoStatsDialogText;

  /// No description provided for @loadingErrorText.
  ///
  /// In en, this message translates to:
  /// **'Loading error: {err}'**
  String loadingErrorText(String err);

  /// No description provided for @statsScreenPerformancesHeaderLabel.
  ///
  /// In en, this message translates to:
  /// **'Your performances'**
  String get statsScreenPerformancesHeaderLabel;

  /// No description provided for @statsScreenTotalGamesRowLabel.
  ///
  /// In en, this message translates to:
  /// **'Games played'**
  String get statsScreenTotalGamesRowLabel;

  /// No description provided for @statsScreenTotalGamesComputerRowLabel.
  ///
  /// In en, this message translates to:
  /// **'Games played against the computer'**
  String get statsScreenTotalGamesComputerRowLabel;

  /// No description provided for @statsScreenTotalGamesLocalRowLabel.
  ///
  /// In en, this message translates to:
  /// **'Games played locally'**
  String get statsScreenTotalGamesLocalRowLabel;

  /// No description provided for @statsScreenTotalGamesEndlessRowLabel.
  ///
  /// In en, this message translates to:
  /// **'Games played in Endless mode'**
  String get statsScreenTotalGamesEndlessRowLabel;

  /// No description provided for @statsScreenVictoryPlayerOneRowLabel.
  ///
  /// In en, this message translates to:
  /// **'Blue Player wins locally'**
  String get statsScreenVictoryPlayerOneRowLabel;

  /// No description provided for @statsScreenVictoryPlayerTwoRowLabel.
  ///
  /// In en, this message translates to:
  /// **'Red Player wins locally'**
  String get statsScreenVictoryPlayerTwoRowLabel;

  /// No description provided for @statsScreenVictoryVersusComputerRowLabel.
  ///
  /// In en, this message translates to:
  /// **'Player wins against the computer'**
  String get statsScreenVictoryVersusComputerRowLabel;

  /// No description provided for @statsScreenTotalDrawsRowLabel.
  ///
  /// In en, this message translates to:
  /// **'Draws'**
  String get statsScreenTotalDrawsRowLabel;

  /// No description provided for @statsScreenCurrentStreakRowLabel.
  ///
  /// In en, this message translates to:
  /// **'Current streak'**
  String get statsScreenCurrentStreakRowLabel;

  /// No description provided for @statsScreenBestStreakRowLabel.
  ///
  /// In en, this message translates to:
  /// **'Best streak'**
  String get statsScreenBestStreakRowLabel;

  /// No description provided for @statsScreenMotivationMessageBestStreakAboveFiveLabel.
  ///
  /// In en, this message translates to:
  /// **'🔥 Legendary streak!'**
  String get statsScreenMotivationMessageBestStreakAboveFiveLabel;

  /// No description provided for @statsScreenMotivationMessageCurrentStreakAboveThreeLabel.
  ///
  /// In en, this message translates to:
  /// **'💪 Keep up the momentum!'**
  String get statsScreenMotivationMessageCurrentStreakAboveThreeLabel;

  /// No description provided for @statsScreenMotivationStartFirstGameLabel.
  ///
  /// In en, this message translates to:
  /// **'🕹️ Start your first game!'**
  String get statsScreenMotivationStartFirstGameLabel;

  /// No description provided for @statsScreenMotivationDefaultLabel.
  ///
  /// In en, this message translates to:
  /// **'Good luck for the next game!'**
  String get statsScreenMotivationDefaultLabel;

  /// No description provided for @coinFlipStartButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Flip the coin'**
  String get coinFlipStartButtonLabel;

  /// No description provided for @coinFlipResultLabel.
  ///
  /// In en, this message translates to:
  /// **'\${playerName} starts!'**
  String coinFlipResultLabel(String playerName);

  /// No description provided for @gameControlsStartComputerActionLabel.
  ///
  /// In en, this message translates to:
  /// **'Play against the computer'**
  String get gameControlsStartComputerActionLabel;

  /// No description provided for @gameControlsStartLocalActionLabel.
  ///
  /// In en, this message translates to:
  /// **'Play against a friend locally'**
  String get gameControlsStartLocalActionLabel;

  /// No description provided for @gameControlsRestartActionLabel.
  ///
  /// In en, this message translates to:
  /// **'Play again'**
  String get gameControlsRestartActionLabel;

  /// No description provided for @gameControlsEndlessModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Endless Mode'**
  String get gameControlsEndlessModeTitle;

  /// No description provided for @gameControlsEndlessModeDialogText.
  ///
  /// In en, this message translates to:
  /// **'Symbols gradually disappear as the game progresses. No draws are possible — the game only ends when a player aligns three symbols.'**
  String get gameControlsEndlessModeDialogText;

  /// No description provided for @okActionLabel.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get okActionLabel;

  /// No description provided for @gameExtensionStatusWinner.
  ///
  /// In en, this message translates to:
  /// **'\${playerName} won 🎉'**
  String gameExtensionStatusWinner(String playerName);

  /// No description provided for @gameExtensionStatusDraw.
  ///
  /// In en, this message translates to:
  /// **'Draw 😐'**
  String get gameExtensionStatusDraw;

  /// No description provided for @gameExtensionStatusDefault.
  ///
  /// In en, this message translates to:
  /// **'Who will be the best?'**
  String get gameExtensionStatusDefault;

  /// No description provided for @gameExtensionStatusTurnPlayer.
  ///
  /// In en, this message translates to:
  /// **'\${playerName}\'s turn'**
  String gameExtensionStatusTurnPlayer(String playerName);

  /// No description provided for @playerOneExtensionName.
  ///
  /// In en, this message translates to:
  /// **'Blue Player'**
  String get playerOneExtensionName;

  /// No description provided for @playerTwoExtensionName.
  ///
  /// In en, this message translates to:
  /// **'Red Player'**
  String get playerTwoExtensionName;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

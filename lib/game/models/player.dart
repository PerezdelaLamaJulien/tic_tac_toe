enum Player { one, two }

extension PlayerExtension on Player {
  String get playerName {
    switch (this) {
      case Player.one:
        return 'Joueur Bleu';
      case Player.two:
        return 'Joueur Rouge';
    }
  }
}

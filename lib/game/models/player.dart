
enum Player { one, two }

extension PlayerExtension on Player {
  String get playerName {
    switch (this) {
      case Player.one:
        return 'Joueur 1';
      case Player.two:
        return 'Joueur 2';
      }
  }
}

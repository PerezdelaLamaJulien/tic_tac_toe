# 🎮 Flutter Tic Tac Toe

Un jeu de **Tic Tac Toe** moderne développé avec **Flutter** et **Riverpod Notifier**, conçu pour démontrer de bonnes pratiques d’architecture, d’état réactif, et une interface fluide avec animations.

---

## 🧱 Fonctionnalités principales

- 🕹️ **Jeu local** à deux joueurs
- 🤖 **Mode contre ordinateur**
- 🎨 **Interface animée** avec effet "Pile ou Face" pour déterminer le joueur de départ
- 🧩 **Clean Architecture** data/presentation avec Riverpod
- 🏆 **Détection des lignes gagnantes** avec animation visuelle
- 🔁 **Bouton Rejouer** pour recommencer instantanément
- ♾️ **Mode Endless** où les symboles disparaissent au fur et à mesure que la partie pour plus de stratégie
- 💾 **Sauvegarde** des statistiques du joueur
- 🧪 **Tests unitaires et widgets**

---

## 🗂️ Structure du projet

```
lib/
├─ main.dart 
├─ data/
│ ├─ models/
│ │ ├─ game_mode.dart
│ │ ├─ game_state.dart
│ │ ├─ game_stats.dart
│ │ ├─ player.dart
│ │ ├─ tile_state.dart
│ │ ├─ winning_line_state.dart
│ ├─ providers/
│ │ ├─ computer_repository_provider.dart
│ │ ├─ stats_repository_provider.dart
│ ├─ repositories/
│ │ ├─ computer_repository.dart
│ │ ├─ stats_repository.dart
├─ presentation/
│ ├─ notifiers/
│ │ ├─ game_notifier.dart
│ │ ├─ stats_notifier.dart
│ ├─ providers/
│ │ ├─ game_provider.dart
│ │ ├─ stats_provider.dart
│ ├─ ui/
│ │ ├─ screens/ 
│ │ │ ├─ game_screen.dart
│ │ │ ├─ stats_screen.dart
│ │ ├─ widgets/ 
│ │ │ ├─ board_game.dart 
│ │ │ ├─ board_tile.dart
│ │ │ ├─ coin_flip.dart
│ │ │ ├─ game_controls_panel.dart

```
---

## 🧠 Architecture

Le projet repose sur **Riverpod** pour une gestion d’état claire et testable :

- `GameNotifier` → gère le plateau, les coups joués et la logique de victoire
- `ComputerRepositoryProvider` → joue automatiquement le tour de l’ordinateur
- `StatsRepositoryProvider` → permet de charger et de mettre a jour les statistiques du joueur avec les SharedPreferences

Chaque modification d’état notifie automatiquement les widgets abonnés, garantissant une UI toujours synchronisée.

---

## 🧩 IA — Mode ordinateur

L’IA est encapsulée dans un provider dédié (`ComputerRepositoryProvider`) qui :
- observe l’état du jeu (`GameState`) ;
- détermine les coups disponibles ;
- choisit un coup selon une logique simple aléatoire ou optimisé pour gagner/ ne pas perdre la partie

Une évolution future intégrera l’algorithme **Minimax** pour un niveau “impossible à battre”.

---

## 🎨 Interface utilisateur

- **Plateau** : grille 3×3 avec détection des cases gagnantes
- **Barre rouge animée** : indique la ligne gagnante
- **Coin Flip** : animation 3D simulant un tirage au sort pour choisir le joueur de départ
- **Panneau de contrôle** : affiche le joueur actuel et un bouton pour recommencer

L’interface est réactive et s'adapte à l'orientation de l'écran.

---

## 🧪 Tests

Des tests unitaires et widgets sont présent pour assurer la qualité du code :
- `test/data/models/game_state_test.dart`
- `test/data/models/player_test.dart`
- `test/data/models/tile_state_test.dart`
- `test/data/repositories/computer_provider_test.dart`
- `test/data/repositories/stats_repository_test.dart`
- `test/presentation/notifiers/game_notifier_test.dart`
- `test/presentation/notifiers/stats_notifier_test.dart`
- `test/presentation/ui/board_game_test.dart`
- `test/presentation/ui/board_tile_test.dart`
- `test/presentation/ui/coin_flip_test.dart`
- `test/presentation/ui/game_controls_panel_test.dart`
- `test/presentation/ui/game_screen_test.dart`

### Exécution des tests
```bash
flutter test
```

## 🚀 Lancer le projet
### 🧩 Prérequis

- Flutter SDK ≥ 3.19
- Dart ≥ 3.3
- Un éditeur compatible (VSCode / Android Studio)

▶️ Démarrer

```bash
flutter pub get
flutter run
```

### ⚙️ Technologies utilisées

| Domaine     | Outil / Librairie                |
| ----------- |----------------------------------|
| État global | [Riverpod](https://riverpod.dev) |
| Interface   | Flutter Widgets & Material       |
| Animation   | Flutter `AnimatedBuilder`        |
| Test        | `flutter_test`, `mockito`        |
| Typage      | Dart 3.0 (enums enrichis)        |

### 🔮 Évolutions prévues

- 🌐 Mode multijoueur en ligne (Firebase Realtime Database) avec invitation et plus tard matchmaking
- 🧠 IA “Minimax” avec différents niveaux de difficulté

### 👨‍💻 Auteur

Julien Perez de la Lama
💼 Projet réalisé dans le cadre d’un recrutement Développeur Flutter.
📧 Contact : perezdelalama.julien@gmail.com

🌐 GitHub : github.com/PerezdelaLamaJulien/
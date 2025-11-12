# 🎮 Flutter Tic Tac Toe

Un jeu de **Tic Tac Toe** moderne développé avec **Flutter** et **Riverpod Notifier**, conçu pour démontrer de bonnes pratiques d’architecture, d’état réactif, et une interface fluide avec animations.

---

## 🧱 Fonctionnalités principales

- 🕹️ **Jeu local** à deux joueurs
- 🤖 **Mode contre ordinateur** (IA intégrée via `ComputerProvider`)
- 🎨 **Interface animée** avec effet "Pile ou Face" pour déterminer le joueur de départ
- 🧩 **Architecture modulaire** avec `Notifier` (Riverpod 3.x)
- 🏆 **Détection des lignes gagnantes** avec animation visuelle
- 🔁 **Bouton Rejouer** pour recommencer instantanément
- ♾️ **Mode Endless** où les symboles disparaissent au fur et à mesure que la partie pour plus de stratégie
- 🧪 **Tests unitaires et widgets**

---

## 🗂️ Structure du projet

```
lib/
├─ main.dart # Point d'entrée Flutter
├─ game/
│ ├─ game_notifier.dart # Logique principale du jeu
│ ├─ computer_provider.dart # Gestion du mode IA
│ ├─ models/ # Modèles de données du jeu
│ │ ├─ game_mode.dart
│ │ ├─ game_state.dart
│ │ ├─ player.dart
│ │ ├─ tile_state.dart
│ │ ├─ winning_line_state.dart
│
├─ ui/
│ ├─ board_game.dart # Plateau principal
│ ├─ board_tile.dart # Case individuelle
│ ├─ coin_flip.dart # Animation du pile ou face
│ ├─ game_controls_panel.dart # Boutons pour controler le jeu
│ ├─ game_screen.dart # Écran principal du jeu
```
---

## 🧠 Architecture

Le projet repose sur **Riverpod (Notifier)** pour une gestion d’état claire et testable :

- `GameNotifier` → gère le plateau, les coups joués et la logique de victoire
- `ComputerProvider` → joue automatiquement le tour de l’ordinateur
- `GameState` → structure immuable représentant la partie courante

Chaque modification d’état notifie automatiquement les widgets abonnés, garantissant une UI toujours synchronisée.

---

## 🧩 IA — Mode ordinateur

L’IA est encapsulée dans un provider dédié (`ComputerProvider`) qui :
- observe l’état du jeu (`GameState`) ;
- détermine les coups disponibles ;
- choisit un coup selon une logique simple (aléatoire ou heuristique).

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
- `test/game/game_notifier_test.dart`
- `test/game/computer_provider_test.dart`
- `test/game/models/game_state_test.dart`
- `test/game/models/player_test.dart`
- `test/game/models/tile_state_test.dart`
- `test/game/models/winning_line_state_test.dart`
- `test/ui/board_game_test.dart`
- `test/ui/board_tile_test.dart`
- `test/ui/coin_flip_test.dart`
- `test/ui/game_controls_panel_test.dart`
- `test/ui/game_screen_test.dart`

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

- ♾️ Mode endless pour éviter les draws (on fait supprimer les coups au fur et a mesure que la partie avance)
- 🌐 Mode multijoueur en ligne (Firebase Realtime Database) avec invitation et plus tard matchmaking
- 🧠 IA “Minimax” avec différents niveaux de difficulté
- 💾 Sauvegarde des scores et statistiques
- 📱 Thème sombre / clair

### 👨‍💻 Auteur

Julien Perez de la Lama
💼 Projet réalisé dans le cadre d’un recrutement Flutter Developer.
📧 Contact : perezdelalama.julien@gmail.com

🌐 GitHub : github.com/PerezdelaLamaJulien/
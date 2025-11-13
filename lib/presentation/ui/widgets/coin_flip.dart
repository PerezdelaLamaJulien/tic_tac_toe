import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/presentation/l10n/app_localizations.dart';
import 'package:tic_tac_toe/data/models/player.dart';

class CoinFlip extends StatefulWidget {
  final void Function(Player winner) onResult;

  const CoinFlip({super.key, required this.onResult});

  @override
  State<CoinFlip> createState() => _CoinFlipState();
}

class _CoinFlipState extends State<CoinFlip>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isFlipping = false;
  Player? side;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void flipCoin() async {
    if (isFlipping) return;
    setState(() => isFlipping = true);

    await _controller.forward(from: 0);
    final result = Random().nextBool() ? Player.one : Player.two;

    setState(() {
      side = result;
      isFlipping = false;
    });

    widget.onResult(result);
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (_, __) {
            return Transform(
              transform: Matrix4.rotationY(_animation.value),
              alignment: Alignment.center,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isFlipping
                      ? (_animation.value < pi ? Colors.indigo : Colors.red.shade700)
                      : (side == Player.one ? Colors.indigo : Colors.red.shade700),
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 4),
                  ],
                ),
                child: Center(
                  child: Text(
                    isFlipping
                        ? (_animation.value < pi ? 'X' : 'O')
                        : (side == Player.one ? 'X' : 'O'),
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: isFlipping
                          ? (_animation.value < pi ? Colors.blueAccent : Colors.redAccent)
                          : (side == Player.one ? Colors.blueAccent : Colors.redAccent),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: flipCoin,
          child: Text(isFlipping ? '...' : localization.coinFlipStartButtonLabel),
        ),
        if (side != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              localization.coinFlipResultLabel(side!.playerName(localization)),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

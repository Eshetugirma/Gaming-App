import 'package:flutter/material.dart';
import 'package:gaming_app/game/assets.dart';
import 'package:gaming_app/game/gaming_page.dart';

class MenuPage extends StatelessWidget {
  final HomePage game;
  static const String id = "Menu";
  const MenuPage({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          game.overlays.remove('Menu');
          game.resumeEngine();
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.menu),
              fit: BoxFit.cover,
            ),
          ),
          child: Image.asset(Assets.message),
        ),
      ),
    );
  }
}

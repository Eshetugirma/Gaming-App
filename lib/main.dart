import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaming_app/game/gaming_page.dart';
import 'package:gaming_app/pages/game_over_page.dart';
import 'package:gaming_app/pages/menu_page.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  final game = HomePage();
  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const [MenuPage.id],
      overlayBuilderMap: {
        'Menu': (context, _) => MenuPage(game: game),
        'gameOver': (context, _) => GameOverPage(game: game),
      },
    ),
  );
}

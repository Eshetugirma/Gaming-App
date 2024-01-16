import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:gaming_app/Pages/game_apps.dart';

void main() {
  final game = HomePage();
  runApp(
    GameWidget(game: game),
  );
}

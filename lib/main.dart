import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:gaming_app/game/gaming_page.dart';

void main() {
  final game = HomePage();
  runApp(
    GameWidget(game: game),
  );
}

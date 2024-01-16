import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:gaming_app/game/assets.dart';
import 'package:gaming_app/game/game_apps.dart';

class Background extends SpriteComponent with HasGameRef<HomePage> {
  Background();
  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.backgorund);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}

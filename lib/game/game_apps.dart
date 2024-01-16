import 'package:flame/game.dart';
import 'package:gaming_app/components/background.dart';

class HomePage extends FlameGame {
  Future<void> onLoad() async {
    add(Background());
  }
}

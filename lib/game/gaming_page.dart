import 'package:flame/game.dart';
import 'package:gaming_app/components/background.dart';
import 'package:gaming_app/components/bird.dart';
import 'package:gaming_app/components/ground.dart';
import 'package:gaming_app/components/pipe_group.dart';

class HomePage extends FlameGame {
  late Bird bird;
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
    ]);
  }
}

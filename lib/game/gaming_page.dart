import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:gaming_app/components/background.dart';
import 'package:gaming_app/components/bird.dart';
import 'package:gaming_app/components/ground.dart';
import 'package:gaming_app/components/pipe_group.dart';
import 'package:gaming_app/game/configuration.dart';

class HomePage extends FlameGame {
  HomePage();
  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      // PipeGroup(),
    ]);
    interval.onTick = () => add(PipeGroup());
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }
}

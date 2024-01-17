import 'dart:math';

import 'package:flame/components.dart';
import 'package:gaming_app/components/pipe.dart';
import 'package:gaming_app/game/configuration.dart';
import 'package:gaming_app/game/gaming_page.dart';
import 'package:gaming_app/game/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef<HomePage> {
  PipeGroup();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;
    final heightMinusGround = (gameRef.size.y - Config.groundHeight) ~/ 2;
    final spacing = Random().nextInt(heightMinusGround.toInt());
    print(spacing);

    addAll([
      Pipe(
          height: heightMinusGround + spacing - 150,
          pipePosition: PipePosition.top),
      Pipe(
          height: heightMinusGround - spacing - 100,
          pipePosition: PipePosition.bottom),
    ]);
  }

  @override
  void update(dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;
    if (position.x <= -10) {
      removeFromParent();
    }
  }
}

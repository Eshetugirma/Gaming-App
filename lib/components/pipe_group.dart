import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:gaming_app/components/pipe.dart';
import 'package:gaming_app/game/assets.dart';
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
          height: heightMinusGround + spacing + gameRef.bird.score * 2 - 200,
          pipePosition: PipePosition.bottom),
      Pipe(
          height: heightMinusGround - spacing + gameRef.bird.score * 2 - 50,
          pipePosition: PipePosition.top),
    ]);
  }

  @override
  void update(dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;
    if (position.x <= -10) {
      removeFromParent();
      updateScore();
    }
    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  void updateScore() {
    gameRef.bird.score += 1;
    FlameAudio.play(Assets.point);
  }
}

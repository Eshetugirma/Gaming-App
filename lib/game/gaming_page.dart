import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/painting.dart';
import 'package:gaming_app/components/background.dart';
import 'package:gaming_app/components/bird.dart';
import 'package:gaming_app/components/ground.dart';
import 'package:gaming_app/components/pipe_group.dart';
import 'package:gaming_app/game/configuration.dart';

class HomePage extends FlameGame with TapDetector, HasCollisionDetection {
  HomePage();
  late Bird bird;
  late TextComponent score;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore(),
    ]);
    interval.onTick = () => add(PipeGroup());
  }

  @override
  void onTap() {
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = "Score:${bird.score}";
  }

  TextComponent buildScore() {
    return TextComponent(
      text: "Score: 0",
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
          style: const TextStyle(
              fontSize: 40, fontFamily: 'Game', fontWeight: FontWeight.bold)),
    );
  }
}

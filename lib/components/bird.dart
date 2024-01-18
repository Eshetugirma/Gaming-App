import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:gaming_app/game/assets.dart';
import 'package:gaming_app/game/bird_movement.dart';
import 'package:gaming_app/game/configuration.dart';
import 'package:gaming_app/game/gaming_page.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<HomePage> {
  Bird();
  @override
  Future<void> onLoad() async {
    final birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);
    final birdDownFlap = await gameRef.loadSprite(Assets.birdDownFlap);
    final birdMidFlap = await gameRef.loadSprite(Assets.birdMidFlap);
    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    current = BirdMovement.middle;
    sprites = {
      BirdMovement.middle: birdMidFlap,
      BirdMovement.up: birdUpFlap,
      BirdMovement.down: birdDownFlap,
    };

    void fly() {
      add(
        MoveByEffect(
          Vector2(0, Config.gravity),
          EffectController(duration: 0.2, curve: Curves.decelerate),
          onComplete: () => current = BirdMovement.down,
        ),
      );
      current = BirdMovement.up;
    }

    @override
    void update(double dt) {
      super.update(dt);
      position.y += Config.birdVelocity * dt;
    }
  }

  void fly() {}
}

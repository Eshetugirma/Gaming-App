import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:gaming_app/game/assets.dart';
import 'package:gaming_app/game/configuration.dart';
import 'package:gaming_app/game/gaming_page.dart';

class Ground extends ParallaxComponent<HomePage> {
  Ground();
  @override
  Future<void> onLoad() async {
    final ground = await Flame.images.load(Assets.ground);
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(ground, fill: LayerFill.none),
      ),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = Config.gameSpeed;
  }
}

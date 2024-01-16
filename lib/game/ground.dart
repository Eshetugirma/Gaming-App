import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:gaming_app/game/assets.dart';
import 'package:gaming_app/game/game_apps.dart';

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
  }
}

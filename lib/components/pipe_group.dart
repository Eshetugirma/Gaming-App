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
    addAll([
      Pipe(height: 100, pipePosition: PipePosition.top),
      Pipe(height: 100, pipePosition: PipePosition.top),
    ]);
  }

  @override
  void update(dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;
  }
}

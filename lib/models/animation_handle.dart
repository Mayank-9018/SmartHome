import 'package:flutter/animation.dart';

class AnimationControllerHandle {
  AnimationControllerHandle(this.animationController);

  final AnimationController animationController;

  void forward() => animationController.forward();

  void reverse() => animationController.reverse();
}

import 'package:flutter/material.dart';

class VerticalSlideTransitionWidget extends StatelessWidget {
  final Widget child;
  final int milliseconds;
  final bool fromDownToUp;
  const VerticalSlideTransitionWidget({
    super.key,
    required this.child,
    this.milliseconds = 500,
    this.fromDownToUp = true,
  });

  @override
  Widget build(BuildContext context) {
    final animationCon = AnimationController(
      vsync: Navigator.of(context),
      duration: Duration(milliseconds: milliseconds),
    );

    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(0, fromDownToUp ? 1 : -1),
        end: const Offset(0, 0),
      ).animate(CurvedAnimation(
        parent: animationCon..forward(),
        curve: Curves.easeInOut,
      )),
      child: child,
    );
  }
}

// ignore: must_be_immutable
class ScaleDownTransitionWidget extends StatelessWidget {
  final Widget child;
  final double minSize;
  ScaleDownTransitionWidget(
      {super.key, required this.child, this.minSize = 0.7});

  late AnimationController animationController;

  void onPressed() async {
    if (!animationController.isAnimating) {
      debugPrint('<<<<<<<<<<<Start Animation>>>>>>>>>>>');
      await animationController.forward();
      animationController.reverse();
    }
    // if (!animationController.isAnimating) {
    //   if (animationController.status == AnimationStatus.completed) {
    //     animationController.reverse();
    //   } else {
    //     animationController.forward();
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    animationController = AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(milliseconds: 200),
    );

    return Listener(
      onPointerDown: (event) => onPressed(),
      onPointerUp: (event) => onPressed(),
      child: ScaleTransition(
        scale: Tween<double>(begin: 1, end: minSize).animate(
          animationController,
        ),
        child: child,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AnimatedThumbsUp extends StatefulWidget {
  const AnimatedThumbsUp({super.key});

  @override
  State<AnimatedThumbsUp> createState() => _AnimatedThumbsUpState();
}

class _AnimatedThumbsUpState extends State<AnimatedThumbsUp>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    animation = Tween<double>(
      begin: 0.8,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceOut,
      ),
    );
    Future.delayed(
        const Duration(milliseconds: 100), () => animationController.forward());
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) =>
          Transform.scale(scale: animation.value, child: child),
      child: Image.asset(
        'lib/assets/images/thumbs_up.png',
        width: 130,
      ),
    );
  }
}

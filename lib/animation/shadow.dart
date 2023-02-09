import 'package:flutter/material.dart';

class AnimateShadow extends StatefulWidget {
  Offset begin;
  Offset end;
  Duration duration;
  AnimateShadow(
      {required this.begin,
      required this.duration,
      required this.end,
      super.key});

  @override
  State<AnimateShadow> createState() => _AnimateShadowState();
}

class _AnimateShadowState extends State<AnimateShadow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> shadowController;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    shadowController = Tween<Offset>(begin: widget.begin, end: widget.end)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(offset: shadowController.value, color: Colors.black),
                BoxShadow(color: Colors.white)
              ]),
            ));
  }
}

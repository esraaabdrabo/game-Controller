import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnimateObacity extends StatefulWidget {
  double begin;
  double end;
  Duration duration;
  bool isForward;
  bool isReverse;
  bool isRepeat;

  Widget widget;
  AnimateObacity(
      {required this.begin,
      required this.end,
      required this.widget,
      required this.duration,
      this.isForward = false,
      this.isRepeat = false,
      this.isReverse = false,
      super.key});

  @override
  State<AnimateObacity> createState() => _AnimateObacityState();
}

class _AnimateObacityState extends State<AnimateObacity>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationDouble;

  getTikerFuture() {
    return widget.isForward
        ? _controller.forward()
        : widget.isRepeat
            ? _controller.repeat()
            : widget.isReverse
                ? _controller.reverse()
                : null;
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: widget.duration, vsync: this);
    _animationDouble = Tween<double>(begin: widget.begin, end: widget.end)
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));

    getTikerFuture();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(opacity: _animationDouble, child: widget.widget),
      ),
    );
  }
}

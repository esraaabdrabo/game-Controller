import 'package:flutter/material.dart';

class AnimateHeight extends StatefulWidget {
  double begin;
  double end;
  double width;
  Duration duration;
  bool isForward;
  bool isReverse;
  bool isRepeat;
  dynamic curve;
  Widget widget;
  AnimateHeight(
      {required this.begin,
      required this.end,
      required this.width,
      required this.widget,
      required this.duration,
      this.curve,
      this.isForward = false,
      this.isRepeat = false,
      this.isReverse = false,
      super.key});

  @override
  _AnimateHeightState createState() => _AnimateHeightState();
}

class _AnimateHeightState extends State<AnimateHeight>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

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
    _animation = Tween(begin: widget.begin, end: widget.end).animate(
        CurvedAnimation(
            parent: _controller, curve: widget.curve ?? Curves.ease));
    getTikerFuture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return SizedBox(
            width: widget.width,
            height: _animation.value,
            child: widget.widget,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

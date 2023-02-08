import 'package:flutter/material.dart';

class AnimateSize extends StatefulWidget {
  double begin;
  double end;
  Duration duration;
  bool isForward;
  bool isReverse;
  bool isRepeat;

  Widget widget;
  AnimateSize(
      {required this.begin,
      required this.end,
      required this.widget,
      required this.duration,
      this.isForward = false,
      this.isRepeat = false,
      this.isReverse = false,
      super.key});

  @override
  _AnimateSizeState createState() => _AnimateSizeState();
}

class _AnimateSizeState extends State<AnimateSize>
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
    _animation =
        Tween(begin: widget.begin, end: widget.end).animate(_controller);
    getTikerFuture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Center(
            child: SizedBox(
              width: _animation.value,
              height: _animation.value,
              child: widget.widget,
            ),
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

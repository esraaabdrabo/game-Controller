import 'package:flutter/material.dart';

class AnimateText extends StatefulWidget {
  double begin;
  double end;
  Duration duration;
  bool isForward;
  bool isReverse;
  bool isRepeat;

  Widget widget;
  AnimateText(
      {required this.begin,
      required this.end,
      required this.widget,
      required this.duration,
      this.isForward = false,
      this.isRepeat = false,
      this.isReverse = false,
      super.key});

  @override
  State<AnimateText> createState() => _AnimateTextState();
}

class _AnimateTextState extends State<AnimateText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
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
    _animation = Tween<double>(begin: widget.begin, end: widget.end).animate(
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
        child: FadeTransition(
          opacity: _animation,
          child: widget.widget,
        ),
      ),
    );
  }
}

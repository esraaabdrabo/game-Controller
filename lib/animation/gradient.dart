import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class AnimateGradient extends StatefulWidget {
  double begin;
  double end;
  double width;
  double height;
  Duration duration;
  bool isForward;
  bool isReverse;
  bool isRepeat;
  dynamic curve;
  Widget widget;
  List<Color> colors;
  AnimateGradient(
      {required this.begin,
      required this.end,
      required this.width,
      required this.height,
      required this.colors,
      required this.widget,
      required this.duration,
      this.curve = Curves.bounceIn,
      this.isForward = false,
      this.isRepeat = false,
      this.isReverse = false,
      super.key});

  @override
  State<AnimateGradient> createState() => _AnimateGradientState();
}

class _AnimateGradientState extends State<AnimateGradient>
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
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    getTikerFuture();
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
              padding:
                  EdgeInsets.symmetric(horizontal: 1.25.w, vertical: 1.5.h),
              alignment: Alignment.center,
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: widget.colors,
                    transform: GradientRotation(_animationDouble.value)),
              ),
              child: widget.widget,
            ));
  }
}

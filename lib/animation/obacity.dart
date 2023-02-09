import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

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
    return FadeTransition(opacity: _animationDouble, child: widget.widget);
  }
}

class AnimateObacityExample extends StatelessWidget {
  const AnimateObacityExample({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimateObacity(
        isRepeat: true,
        begin: -1,
        end: 1,
        widget: Align(
            alignment: Alignment.center,
            child: Text(
              'ESRAA Abdrabo',
              style: GoogleFonts.cairo(
                  fontSize: 25.sp,
                  shadows: [
                    const BoxShadow(
                        offset: Offset(5, -5),
                        blurRadius: 2,
                        color: Color.fromARGB(40, 0, 0, 0))
                  ],
                  color: Colors.blueGrey),
            )),
        duration: const Duration(milliseconds: 2500));
  }
}

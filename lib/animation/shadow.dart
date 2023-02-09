import 'package:esraaabdrabo/animation/offset.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

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
                const BoxShadow(color: Colors.white)
              ]),
            ));
  }
}

class AnimateShadowExample extends StatefulWidget {
  Offset begin;
  Offset end;
  Duration duration;
  AnimateShadowExample(
      {required this.begin,
      required this.duration,
      required this.end,
      super.key});

  @override
  State<AnimateShadowExample> createState() => _AnimateShadowExampleState();
}

class _AnimateShadowExampleState extends State<AnimateShadowExample>
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
              alignment: Alignment.center,
              height: 200,
              width: 200,
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                    offset: shadowController.value, color: Colors.blueGrey),
                const BoxShadow(color: Colors.white)
              ]),
              child: AnimateOffset(
                  begin: const Offset(0, 50),
                  end: Offset.zero,
                  duration: const Duration(milliseconds: 2500),
                  isForward: true,
                  widget: Text(
                    'E',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                        fontSize: 20.sp, color: Colors.blueGrey),
                  )),
            ));
  }
}

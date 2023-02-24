import 'dart:developer';

import 'package:flutter/material.dart';

import '../../offset.dart';

class FallingWidget extends StatefulWidget {
  bool start;
  Widget widget;
  int milliSeconds = 1500;
  FallingWidget(
      {required this.start,
      required this.widget,
      super.key,
      this.milliSeconds = 1500});

  @override
  State<FallingWidget> createState() => _FallingWidgetState();
}

class _FallingWidgetState extends State<FallingWidget> {
  bool canFallNow = false;

  @override
  Widget build(BuildContext context) {
    void changeCanFallNow() {
      Future.delayed(Duration(milliseconds: 100)).then((value) {
        canFallNow = true;
        setState(() {});
      });
    }

    changeCanFallNow();
    return canFallNow
        ? Transform.rotate(
            angle: -50,
            child: AnimateOffset(
                begin: Offset.zero,
                end: const Offset(0, 50),
                duration: Duration(milliseconds: widget.milliSeconds),
                curve: Curves.easeInOutCubic,
                isForward: widget.start,
                widget: widget.widget),
          )
        : Transform.rotate(
            angle: -50,
            child: widget.widget,
          );
  }
}

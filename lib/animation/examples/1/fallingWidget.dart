import 'package:flutter/material.dart';

import '../../offset.dart';

class FallingWidget extends StatelessWidget {
  bool start;
  Widget widget;
  int milliSeconds = 1500;
  FallingWidget(
      {required this.start,
      required this.widget,
      super.key,
      this.milliSeconds = 1500});

  @override
  Widget build(BuildContext context) {
    return AnimateOffset(
        begin: Offset.zero,
        end: const Offset(0, 50),
        duration: Duration(milliseconds: milliSeconds),
        curve: Curves.easeInOutCubic,
        isForward: start,
        widget: widget);
  }
}

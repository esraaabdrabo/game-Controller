import 'package:flutter/cupertino.dart';

class PlayControllerVM extends ChangeNotifier {
  List<String> moves = [
    "lib/images/circle.png",
    "lib/images/triangle.png",
    "lib/images/square.png",
    "lib/images/x.png"
  ];
  bool showMoves = false;
  String result = "";
  void changeShowMoves(bool value) {
    showMoves = value;
    notifyListeners();
  }

  void changeResult(int index) {
    result = moves[index];
    notifyListeners();
  }

  void clearResult() {
    result = "";
    notifyListeners();
  }
}

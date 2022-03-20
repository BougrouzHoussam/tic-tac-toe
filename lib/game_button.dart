import 'package:flutter/material.dart';

class GameButton {
  late int id;
  late bool enabled;
  late String str;
  late Color clr;
  GameButton(id) {
    this.id = id;
    enabled = true;
    this.str = "";
    this.clr = Colors.transparent;
  }
}

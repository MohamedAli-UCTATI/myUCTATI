import 'package:flutter/material.dart';

class Pallette {
  Pallette(this.isDarkMode);
  bool isDarkMode;

  Color get iconColor => isDarkMode ? Colors.white : Colors.black;
  Color get textColor => isDarkMode ? Colors.white : Colors.black;
  Color get backgroundColor => isDarkMode ? Colors.black : Colors.white;
}

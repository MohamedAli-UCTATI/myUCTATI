import 'package:flutter/material.dart';

class Pallette {
  Pallette(this.isDarkMode);
  bool isDarkMode;

  Color get iconColor => isDarkMode ? Colors.white : Colors.black;
  Color get textColor => isDarkMode ? Colors.white : Colors.black;
  Color get backgroundColor => isDarkMode ? Colors.black : Colors.white;
  Color get cardColor => isDarkMode ? Colors.white10 : Colors.white;
  Color get cardSurfaceTintColor =>
      isDarkMode ? const Color.fromARGB(255, 50, 50, 50) : Colors.white;
}

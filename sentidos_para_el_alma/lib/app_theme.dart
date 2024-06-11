import 'package:flutter/material.dart';

const Color _customColor = Color(0xff409149f);
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Colors.red,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 4});

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}

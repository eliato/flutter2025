import 'package:flutter/material.dart';

const Color _customcolor = Color.fromARGB(255, 0, 106, 255);

const List<Color> _colorsTheme = [
  _customcolor,
  Colors.blue,
  Colors.teal,
  Colors.indigoAccent,
  Colors.yellow,
  Colors.pink,
  Colors.orange,
];

class AppTheme {
  final int selectColor;
  

  AppTheme({this.selectColor = 0})
    : assert(
        selectColor >= 0 && selectColor < _colorsTheme.length ,
        'Invalid color index',
      );

  ThemeData themeData() {
    return ThemeData(
      colorSchemeSeed: _colorsTheme[selectColor],
      //brightness: Brightness.dark,
    );
  }
}

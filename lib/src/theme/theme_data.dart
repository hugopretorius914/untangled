import 'package:flutter/widgets.dart';

const colorBlack = Color.fromRGBO(0, 0, 0, 1);
const colorWhite = Color.fromARGB(255, 255, 255, 255);
const colorPrimary = Color.fromRGBO(47, 109, 236, 1);
BorderRadius chipRadius = BorderRadius.circular(10);
BorderRadius buttonRadius = BorderRadius.circular(100);

class ThemeData {
  const ThemeData({
    this.primaryColor = colorPrimary,
    this.buttonTheme = const ButtonTheme(),
    this.chipTheme = const ChipTheme(),
  });

  final ButtonTheme buttonTheme;
  final ChipTheme chipTheme;
  final Color primaryColor;
}

class ButtonTheme {
  const ButtonTheme({
    this.foregroundColor = colorWhite,
    this.backgroundColor = colorPrimary,
    this.padding = const EdgeInsets.all(20),
    this.borderRadius,
  });

  final Color foregroundColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final BorderRadius? borderRadius;
}

class ChipTheme {
  const ChipTheme({
    this.foregroundColor = colorWhite,
    this.backgroundColor = colorBlack,
    this.padding = const EdgeInsets.all(10),
    this.borderRadius,
  });

  final Color foregroundColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final BorderRadius? borderRadius;
}

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
    this.canvasColor = colorBlack,
    this.textColor = colorWhite,
  });

  factory ThemeData.defaultLight() {
    return const ThemeData(
      canvasColor: colorWhite,
      textColor: colorBlack,
      buttonTheme: ButtonTheme(
        foregroundColor: colorBlack,
        backgroundColor: colorPrimary,
      ),
      chipTheme: ChipTheme(
        foregroundColor: colorBlack,
        backgroundColor: colorWhite,
      ),
    );
  }

  factory ThemeData.defaultDark() {
    return const ThemeData(
      buttonTheme: ButtonTheme(),
      chipTheme: ChipTheme(),
    );
  }

  final ButtonTheme buttonTheme;
  final ChipTheme chipTheme;
  final Color primaryColor;
  final Color canvasColor;
  final Color textColor;
}

class ButtonTheme {
  const ButtonTheme({
    this.canvasColor = colorBlack,
    this.foregroundColor = colorWhite,
    this.backgroundColor = colorPrimary,
    this.padding = const EdgeInsets.all(20),
    this.borderRadius,
  });

  final Color foregroundColor;
  final Color backgroundColor;
  final Color canvasColor;
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

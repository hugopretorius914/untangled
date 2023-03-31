import 'package:flutter/widgets.dart';

import 'theme_data.dart';

class Theme extends InheritedWidget {
  const Theme({
    required this.theme,
    required super.child,
    required this.setLight,
    this.themeLight,
    required this.light,
    super.key,
  });

  final ThemeData theme;
  final ThemeData? themeLight;
  final bool light;

  ThemeData get currentTheme {
    return light ? themeLight ?? theme : theme;
  }

  final void Function(bool) setLight;

  static Theme? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Theme>();
  }

  static Theme of(BuildContext context) {
    final Theme? result = maybeOf(context);
    assert(result != null, 'No ThemeProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Theme oldWidget) =>
      theme != oldWidget.theme ||
      themeLight != oldWidget.themeLight ||
      light != oldWidget.light;
}

class UntangledApp extends StatefulWidget {
  const UntangledApp({
    required this.child,
    required this.theme,
    this.themeLight,
    super.key,
  });
  final Widget child;
  final ThemeData theme;
  final ThemeData? themeLight;

  @override
  MyState createState() => MyState();
}

class MyState extends State<UntangledApp> {
  bool _isLight = false;

  void setIsLight(bool isLight) {
    setState(() {
      _isLight = isLight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      setLight: setIsLight,
      light: _isLight,
      theme: const ThemeData(
        buttonTheme: ButtonTheme(),
        chipTheme: ChipTheme(),
      ),
      themeLight: ThemeData.defaultLight(),
      child: widget.child,
    );
  }
}

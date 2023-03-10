import 'package:flutter/widgets.dart';

import 'theme_data.dart';

class UntangledApp extends InheritedWidget {
  const UntangledApp({
    super.key,
    required this.themeData,
    required super.child,
  });

  final ThemeData themeData;

  static UntangledApp? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UntangledApp>();
  }

  static UntangledApp of(BuildContext context) {
    final UntangledApp? result = maybeOf(context);
    assert(result != null, 'No ThemeProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(UntangledApp oldWidget) =>
      themeData != oldWidget.themeData;
}

import 'package:flutter/widgets.dart';
import 'package:untangled/src/theme/theme_data.dart';
import 'package:untangled/src/theme/theme_provider.dart';

class Canvas extends StatelessWidget {
  const Canvas({
    required this.child,
    this.color,
    super.key,
  });

  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context).currentTheme;
    return Positioned.fill(
      child: ColoredBox(color: color ?? theme.canvasColor, child: child),
    );
  }
}

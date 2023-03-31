import 'package:flutter/widgets.dart';
import 'package:untangled/src/theme/theme_data.dart';
import 'package:untangled/src/theme/theme_provider.dart';

class Button extends StatelessWidget {
  const Button({
    required this.label,
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context).currentTheme;
    ButtonTheme buttonTheme = theme.buttonTheme;
    return GestureDetector(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 220),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: buttonTheme.borderRadius ?? buttonRadius,
            color: buttonTheme.backgroundColor,
          ),
          padding: buttonTheme.padding,
          child: Text(
            label,
            style: TextStyle(color: buttonTheme.foregroundColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

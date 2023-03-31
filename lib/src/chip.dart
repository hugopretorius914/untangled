import 'package:flutter/widgets.dart';
import 'package:untangled/src/theme/theme_data.dart';
import 'package:untangled/src/theme/theme_provider.dart';

class Chip extends StatelessWidget {
  const Chip({
    required this.label,
    required this.onTap,
    this.active = false,
    super.key,
  });

  final VoidCallback onTap;
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context).currentTheme;
    ChipTheme chipTheme = theme.chipTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: chipTheme.padding,
        decoration: BoxDecoration(
          border: Border.all(color: chipTheme.foregroundColor, width: 1),
          borderRadius: chipTheme.borderRadius ?? chipRadius,
          color: active ? chipTheme.backgroundColor : chipTheme.foregroundColor,
        ),
        child: Text(
          label,
          style: TextStyle(
            color:
                active ? chipTheme.foregroundColor : chipTheme.backgroundColor,
          ),
        ),
      ),
    );
  }
}

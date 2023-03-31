import 'package:flutter/widgets.dart';

import 'theme/theme_provider.dart';

enum FontVariant {
  body,
  button,
  chip,
  headline,
  label,
  title,
}

class Typography extends StatelessWidget {
  const Typography(
    this.text, {
    this.variant = FontVariant.body,
    super.key,
  });

  final String? text;
  final FontVariant variant;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? variant.defaultText,
      style: TextStyle(
        fontSize: variant.size,
        color: Theme.of(context).currentTheme.textColor,
      ),
    );
  }
}

extension TypographySize on FontVariant {
  double get size {
    switch (this) {
      case FontVariant.body:
        return 18;
      case FontVariant.button:
        return 18;
      case FontVariant.chip:
        return 14;
      case FontVariant.headline:
        return 88;
      case FontVariant.label:
        return 12;
      case FontVariant.title:
        return 22;
    }
  }

  String get defaultText {
    switch (this) {
      case FontVariant.body:
        return 'Body Text';
      case FontVariant.button:
        return 'Button Text';
      case FontVariant.chip:
        return 'Chip Text';
      case FontVariant.headline:
        return 'Headline Text';
      case FontVariant.label:
        return 'Label Text';
      case FontVariant.title:
        return 'Title Text';
    }
  }
}

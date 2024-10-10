import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';
import 'package:my_portfolio_flutter/shared/utils/type_def.dart';

import '../../shared/theme/color_manager.dart';
import '../../shared/theme/theme_getters.dart';

class ContactMeButton extends StatelessWidget {
  const ContactMeButton({
    super.key,
    required this.contact,
  });

  final OnTapCallback contact;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: contact,
      key: key,
      child: Container(
        padding: context.responsivePadding(horizontal: 42, vertical: 18),
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.primary),
          borderRadius: BorderRadius.circular(context.responsiveRadius(5.33)),
        ),
        child: Text(
          'Contact Me',
          style: textTheme(context).titleSmall?.copyWith(
              fontSize: context.responsiveFontSize(21.33),
              color: colorScheme(context).primary),
        ),
      ),
    );
  }
}

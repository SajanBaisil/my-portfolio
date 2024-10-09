import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';

import '../../shared/theme/color_manager.dart';
import '../../shared/theme/theme_getters.dart';

class DownloadResumeButton extends StatefulWidget {
  const DownloadResumeButton({
    super.key,
  });

  @override
  State<DownloadResumeButton> createState() => _DownloadResumeButtonState();
}

class _DownloadResumeButtonState extends State<DownloadResumeButton> {
  final ValueNotifier<bool> onHovered = ValueNotifier(false);

  @override
  void dispose() {
    onHovered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        onHovered.value = value;
      },
      onTap: () {
        js.context.callMethod('open', [
          'https://drive.google.com/file/d/1g8VZ-DxOwY202EvhqYb17vsnV9wzgLB4/view?usp=sharing'
        ]);
      },
      child: ValueListenableBuilder(
          valueListenable: onHovered,
          builder: (context, value, _) {
            return Container(
              decoration: BoxDecoration(
                  color: value
                      ? ColorManager.secondaryBackground
                      : ColorManager.primary,
                  borderRadius:
                      BorderRadius.circular(context.responsiveRadius(5.33))),
              padding:
                  context.responsivePadding(horizontal: 40, vertical: 18.67),
              child: Text(
                'Download Resume',
                style: textTheme(context).displayMedium?.copyWith(
                    color: ColorManager.whiteColor,
                    fontSize: context.responsiveFontSize(21.33)),
              ),
            );
          }),
    );
  }
}

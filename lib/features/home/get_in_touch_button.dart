import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

// for mobile

class DownloadResumeButtonMobile extends StatefulWidget {
  const DownloadResumeButtonMobile({
    super.key,
  });

  @override
  State<DownloadResumeButtonMobile> createState() =>
      _DownloadResumeButtonMobileState();
}

class _DownloadResumeButtonMobileState
    extends State<DownloadResumeButtonMobile> {
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
                  borderRadius: BorderRadius.circular(20.r)),
              padding:
                  context.responsivePadding(horizontal: 40, vertical: 18.67),
              child: Text(
                'Download Resume',
                textAlign: TextAlign.center,
                style: textTheme(context)
                    .displayMedium
                    ?.copyWith(color: ColorManager.whiteColor, fontSize: 18.sp),
              ),
            );
          }),
    );
  }
}

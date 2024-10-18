import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio_flutter/features/home/get_in_touch_button.dart';
import 'package:my_portfolio_flutter/shared/logic/shared_cubit/shared_cubit.dart';
import 'package:my_portfolio_flutter/shared/theme/theme_getters.dart';
import 'package:my_portfolio_flutter/shared/utils/enums.dart';
import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../shared/theme/color_manager.dart';
import '../../shared/utils/assets_manager.dart';

class HomeSectionWidgetMobile extends StatelessWidget {
  const HomeSectionWidgetMobile({
    super.key,
    required this.index,
    required this.controller,
  });
  final int? index;
  final AutoScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('$index'),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;

        if (visiblePercentage > 20) {
          context
              .read<SharedCubit>()
              .setSelectedSection(selectedSection: SelectedSection.home);
        }
      },
      child: AutoScrollTag(
        index: index ?? 0,
        controller: controller!,
        key: ValueKey(index),
        child: Container(
          key: key,
          decoration: BoxDecoration(
              color: ColorManager.secondary,
              border: Border.all(
                color: ColorManager.secondary,
              )),
          padding: context.responsivePadding(horizontal: 85.33, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AssetsManager.homeScreenImage,
                height: context.responsiveHeight(600),
              )
                  .animate()
                  .fadeIn(delay: 800.ms, duration: 800.ms)
                  .scaleX(begin: 0.8, end: 1.0, curve: Curves.easeOut),
              // Title Animation with staggered delay and smooth fade/slide
              Text(
                'Hey, I am Sajan Baisil',
                style: textTheme(context).titleSmall?.copyWith(
                      color: ColorManager.whiteColor,
                      fontSize: 16.sp,
                    ),
              )
                  .animate()
                  .fadeIn(duration: 600.ms) // Smooth fade-in
                  .slideY(
                      begin: -0.5,
                      end: 0,
                      curve: Curves.easeOut), // Slide-in from top
              SizedBox(
                height: 18.h,
              ),
              Animate(
                effects: const [
                  FadeEffect(duration: Duration(milliseconds: 600)),
                  SlideEffect(
                      begin: Offset(0.0, 0.5),
                      end: Offset.zero,
                      duration: Duration(milliseconds: 600),
                      delay: Duration(milliseconds: 200))
                ],
                child: RichText(
                  text: TextSpan(
                    text: 'I build',
                    style: textTheme(context).titleMedium?.copyWith(
                          fontSize: 20.sp,
                          color: ColorManager.whiteColor,
                        ),
                    children: [
                      TextSpan(
                        text: ' responsive mobile apps',
                        style: textTheme(context).titleMedium?.copyWith(
                              color: ColorManager.primary,
                              fontSize: 20.sp,
                            ),
                      ),
                      TextSpan(
                        text:
                            '\nwith a focus on smooth UI \nand optimized performance.',
                        style: textTheme(context).titleMedium?.copyWith(
                              fontSize: 20.sp,
                              color: ColorManager.whiteColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: context.responsiveHeight(21.33),
              ),
              // Text(
              //   'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nSuspendisse varius enim in eros elementum tristique.',
              //   style: textTheme(context).titleSmall?.copyWith(
              //         fontSize: context.responsiveFontSize(21.33),
              //         color: ColorManager.whiteColor,
              //       ),
              // )
              //     .animate()
              //     .fadeIn(delay: 400.ms, duration: 600.ms)
              //     .slideY(begin: 1.0, end: 0.0, curve: Curves.easeOut),
              // SizedBox(
              //   height: context.responsiveHeight(53.33),
              // ),
              SizedBox(
                width: double.infinity,
                child: const DownloadResumeButtonMobile().animate().fadeIn(
                      delay: 600.ms,
                      duration: 600.ms,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

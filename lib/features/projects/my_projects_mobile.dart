import 'dart:js' as js;
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../shared/logic/shared_cubit/shared_cubit.dart';
import '../../shared/theme/color_manager.dart';
import '../../shared/theme/theme_getters.dart';
import '../../shared/utils/assets_manager.dart';
import '../../shared/utils/enums.dart';
import 'project_card_mobile.dart';

class MyProjectsSectionMobile extends StatefulWidget {
  const MyProjectsSectionMobile(
      {super.key,
      required this.title,
      this.showGitHubButton = true,
      required this.index,
      required this.controller,
      this.isBlog = false});

  final String title;
  final bool showGitHubButton;
  final int index;
  final bool isBlog;
  final AutoScrollController? controller;

  @override
  State<MyProjectsSectionMobile> createState() =>
      _MyProjectsSectionMobileState();
}

class _MyProjectsSectionMobileState extends State<MyProjectsSectionMobile> {
  final ValueNotifier<bool> onHovered = ValueNotifier(false);

  @override
  void dispose() {
    onHovered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.responsivePadding(horizontal: 85.33, vertical: 10),
      decoration: BoxDecoration(
          color: ColorManager.secondary,
          border: Border.all(
            color: ColorManager.secondary,
          )),
      child: AutoScrollTag(
        index: widget.index,
        controller: widget.controller!,
        key: ValueKey(widget.index),
        child: Column(
          key: widget.key,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Apply animation to the title
                GradientAnimationText(
                  text: Text(
                    widget.title,
                    style: textTheme(context).titleMedium?.copyWith(
                          fontSize: 20.sp,
                          color: ColorManager.whiteColor,
                        ),
                  ),
                  // Slide-in from top
                  colors: const [
                    ColorManager.primary,
                    ColorManager.secondaryBackground,
                  ],
                  duration: const Duration(seconds: 5),
                  transform: const GradientRotation(math.pi / 4),
                )
                    .animate()
                    .fadeIn(duration: 800.ms) // Fade-in animation
                    .slideY(begin: -0.5, end: 0.0, curve: Curves.easeOut),
                Visibility(
                  visible: widget.showGitHubButton,
                  replacement: const SizedBox(),
                  child: InkWell(
                    onHover: (value) {
                      onHovered.value = value;
                    },
                    onTap: () {
                      js.context.callMethod(
                          'open', ['https://github.com/SajanBaisil']);
                    },
                    child: ValueListenableBuilder(
                        valueListenable: onHovered,
                        builder: (context, value, _) {
                          return Container(
                            padding: context.responsivePadding(
                                horizontal: 21.33, vertical: 13.33),
                            decoration: BoxDecoration(
                                color: value
                                    ? ColorManager.primary
                                    : ColorManager.secondaryBackground,
                                borderRadius: BorderRadius.circular(
                                  context.responsiveRadius(10.667),
                                )),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AssetsManager.globe,
                                  height: 20.h,
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                // Apply animation to the GitHub button text
                                Text(
                                  'Visit My GitHub',
                                  style: textTheme(context)
                                      .displaySmall
                                      ?.copyWith(
                                          color: ColorManager.whiteColor,
                                          fontSize: 14.sp),
                                )
                                    .animate()
                                    .fadeIn(
                                        duration: 1000.ms) // Fade-in animation
                                    .slideX(
                                        begin: 1.0,
                                        end: 0.0,
                                        curve: Curves
                                            .easeOut), // Slide-in from right
                              ],
                            ),
                          )
                              .animate()
                              .fadeIn(
                                  delay: 400.ms,
                                  duration: 600.ms) // Delay for stagger effect
                              .slideX(
                                  begin: 1.0,
                                  end: 0.0,
                                  curve: Curves.easeOut); // Slide-in from right
                        }),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            // Animate the project cards section
            VisibilityDetector(
              key: Key('${widget.index}'),
              onVisibilityChanged: (visibilityInfo) {
                var visiblePercentage = visibilityInfo.visibleFraction * 100;

                if (visiblePercentage > 20) {
                  context.read<SharedCubit>().setSelectedSection(
                      selectedSection: widget.isBlog
                          ? SelectedSection.blogs
                          : SelectedSection.projects);
                }
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return Row(
                      children: [
                        const ProjectCardMobile(),
                        SizedBox(
                          width: context.responsiveWidth(15),
                        )
                      ],
                    ); // Apply stagger delay for each card
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

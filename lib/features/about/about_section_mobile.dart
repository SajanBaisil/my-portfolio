import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio_flutter/shared/logic/shared_cubit/shared_cubit.dart';
import 'package:my_portfolio_flutter/shared/theme/color_manager.dart';
import 'package:my_portfolio_flutter/shared/theme/theme_getters.dart';
import 'package:my_portfolio_flutter/shared/utils/enums.dart';
import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutSectionMobile extends StatefulWidget {
  const AboutSectionMobile({
    super.key,
    required this.index,
    required this.controller,
  });

  final int index;
  final AutoScrollController? controller;
  @override
  State<AboutSectionMobile> createState() => _AboutSectionMobileState();
}

class _AboutSectionMobileState extends State<AboutSectionMobile> {
  final ValueNotifier<bool> _isVisible = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  final List<String> _lines = [
    'Experienced and hard-working app developer with a strong focus on development and innovation.',
    'Proficient in Dart programming language and advanced in Flutter framework for mobile app development.',
    'Strong understanding of mobile app architecture and design patterns for optimal performance.',
    'Skilled in writing efficient, reusable, and modular code for both Android and iOS platforms.',
    '\n',
    'Proven track record of delivering high-quality, fully-functional apps on time and within budget.',
    'Adept at collaborating with cross-functional teams including designers, back-end developers, and product managers.',
    'Familiar with tools for testing, debugging, and deploying mobile applications in production environments.',
  ];

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('${widget.index}'),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;

        if (visiblePercentage > 20) {
          context
              .read<SharedCubit>()
              .setSelectedSection(selectedSection: SelectedSection.aboutMe);
        }
      },
      child: Container(
        key: widget.key,
        decoration: BoxDecoration(
            color: ColorManager.secondary,
            border: Border.all(
              color: ColorManager.secondary,
            )),
        padding: context.responsivePadding(horizontal: 85.33, vertical: 20),
        child: AutoScrollTag(
          controller: widget.controller!,
          index: widget.index,
          key: ValueKey(widget.index),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientAnimationText(
                text: Text(
                  'About',
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  ValueListenableBuilder(
                      valueListenable: _isVisible,
                      builder: (context, visible, _) {
                        return ListView.builder(
                          itemCount: _lines.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return VisibilityDetector(
                              key: Key('line_$index'),
                              onVisibilityChanged: (visibilityInfo) {
                                if (visibilityInfo.visibleFraction > 0.1 &&
                                    !visible) {
                                  _isVisible.value =
                                      true; // Update state to start animation
                                }
                              },
                              child: Text(
                                _lines[index],
                                style: textTheme(context).titleSmall?.copyWith(
                                      color: ColorManager.whiteColor,
                                      fontSize: 16.sp,
                                    ),
                              ).animate(target: visible ? 1 : 0).fade(
                                  duration: 500.ms, delay: (index * 200).ms),
                            );
                          },
                        );
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

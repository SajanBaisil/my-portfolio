import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio_flutter/shared/logic/shared_cubit/shared_cubit.dart';
import 'package:my_portfolio_flutter/shared/theme/color_manager.dart';
import 'package:my_portfolio_flutter/shared/theme/theme_getters.dart';
import 'package:my_portfolio_flutter/shared/utils/enums.dart';
import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../shared/utils/assets_manager.dart';

class AboutMeSection extends StatefulWidget {
  const AboutMeSection({
    super.key,
    required this.index,
    required this.controller,
  });

  final int index;
  final AutoScrollController? controller;
  @override
  State<AboutMeSection> createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutMeSection> {
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
        padding: context.responsivePadding(horizontal: 85.33, vertical: 80),
        child: AutoScrollTag(
          controller: widget.controller!,
          index: widget.index,
          key: ValueKey(widget.index),
          child: Row(
            children: [
              Image.asset(
                AssetsManager.aboutMeImage,
                height: context.responsiveHeight(813.333),
                width: context.responsiveWidth(996),
              ),
              SizedBox(
                width: context.responsiveWidth(15),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Me',
                      style: textTheme(context).titleMedium?.copyWith(
                            fontSize: context.responsiveFontSize(64),
                          ),
                    ),
                    SizedBox(
                      height: context.responsiveHeight(32),
                    ),
                    ValueListenableBuilder(
                        valueListenable: _isVisible,
                        builder: (context, visible, _) {
                          return ListView.builder(
                            padding: const EdgeInsets.all(16.0),
                            itemCount: _lines.length,
                            shrinkWrap: true,
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
                                  style:
                                      textTheme(context).titleSmall?.copyWith(
                                            color: ColorManager.whiteColor,
                                            fontSize:
                                                context.responsiveFontSize(24),
                                          ),
                                ).animate(target: visible ? 1 : 0).fade(
                                    duration: 500.ms, delay: (index * 200).ms),
                              );
                            },
                          );
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio_flutter/features/skills/neumorphic_widget.dart';
import 'package:my_portfolio_flutter/shared/logic/shared_cubit/shared_cubit.dart';
import 'package:my_portfolio_flutter/shared/utils/device_utils.dart';
import 'package:my_portfolio_flutter/shared/utils/enums.dart';
import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../shared/theme/color_manager.dart';
import '../../shared/theme/theme_getters.dart';
import '../../shared/utils/assets_manager.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection(
      {super.key, required this.index, required this.controller});

  final int index;
  final AutoScrollController? controller;

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection>
    with TickerProviderStateMixin {
  late List<AnimationController> _animationControllers;
  late List<Animation<Offset>> _animations;
  late List<Animation<double>> _fadeAnimations;
  final List<bool> _hasAnimated = List.generate(11, (index) => false);

  @override
  void initState() {
    super.initState();

    // Initialize AnimationControllers for each item
    _animationControllers = List.generate(11, (index) {
      return AnimationController(
        vsync: this,
        duration: const Duration(
            milliseconds: 500), // Longer duration for smoother animation
      );
    });

    // Initialize Tweens for each item with different offset animations
    _animations = List.generate(11, (index) {
      return Tween<Offset>(
        begin: Offset((index % 2 == 0) ? -1.0 : 1.0,
            0.0), // Different angles: left (-1) or right (1)
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _animationControllers[index],
        curve: Curves.easeInOut,
      ));
    });

    // Initialize Fade Tweens for each item
    _fadeAnimations = List.generate(11, (index) {
      return Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: _animationControllers[index],
        curve: Curves.easeInOut,
      ));
    });
  }

  @override
  void dispose() {
    // Dispose all AnimationControllers
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _startAnimation(int index) async {
    if (!_hasAnimated[index]) {
      // Delay the start of each animation for a staggered effect
      await Future.delayed(Duration(milliseconds: index * 100));
      _animationControllers[index].forward();
      _hasAnimated[index] = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('${widget.index}'),
      onVisibilityChanged: (vi) {
        if (vi.visibleFraction > 0.1) {
          // Trigger all animations when the widget becomes 10% visible
          for (var i = 0; i < _animationControllers.length; i++) {
            _startAnimation(i);
          }
        }

        var visiblePercentage = vi.visibleFraction * 100;

        if (visiblePercentage > 20) {
          context
              .read<SharedCubit>()
              .setSelectedSection(selectedSection: SelectedSection.skills);
        }
      },
      child: AutoScrollTag(
        index: widget.index,
        controller: widget.controller!,
        key: ValueKey(widget.index),
        child: Container(
          key: widget.key,
          decoration: BoxDecoration(
              color: ColorManager.secondary,
              border: Border.all(
                color: ColorManager.secondary,
              )),
          padding: DeviceUtils(context).isMobile
              ? EdgeInsets.symmetric(horizontal: 85.33.w, vertical: 30.h)
              : context.responsivePadding(horizontal: 85.33, vertical: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientAnimationText(
                text: Text(
                  'My Skills',
                  style: textTheme(context).titleMedium?.copyWith(
                        fontSize: DeviceUtils(context).isMobile
                            ? 20.sp
                            : context.responsiveFontSize(64),
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
              SizedBox(
                height: context.responsiveHeight(80),
              ),
              DeviceUtils(context).isMobile
                  ? SizedBox(
                      height: 200.h,
                      child: ListView.separated(
                        itemCount: 6,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(
                          width: 50.w,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return _buildSkillItem(index);
                        },
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(6, (index) {
                        return _buildSkillItem(index);
                      }),
                    ),
              SizedBox(
                height: context.responsiveHeight(40),
              ),
              DeviceUtils(context).isMobile
                  ? SizedBox(
                      height: 200.h,
                      child: ListView.separated(
                        itemCount: 5,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(
                          width: 50.w,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return _buildSkillItem(index + 6);
                        },
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(5, (index) {
                        return _buildSkillItem(index + 6);
                      }),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillItem(int index) {
    return VisibilityDetector(
      key: Key('item_$index'),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction > 0.1) {
          _startAnimation(index);
        }
      },
      child: FadeTransition(
        opacity: _fadeAnimations[index],
        child: SlideTransition(
          position: _animations[index],
          child: _buildSkillWidget(index),
        ),
      ),
    );
  }

  Widget _buildSkillWidget(int index) {
    // Return your CustomNeumorphism with appropriate content based on index
    switch (index) {
      case 0:
        return const CustomNeumorphism(
          icon: AssetsManager.flutterSvg,
          title: 'Flutter',
        );
      case 1:
        return const CustomNeumorphism(
          icon: AssetsManager.dartSvg,
          title: 'Dart',
        );
      case 2:
        return const CustomNeumorphism(
          icon: AssetsManager.git,
          title: 'Git',
        );
      case 3:
        return const CustomNeumorphism(
          icon: AssetsManager.bloc,
          title: 'Bloc',
          isIconSvg: false,
        );
      case 4:
        return const CustomNeumorphism(
          icon: AssetsManager.flutterSvg,
          title: 'Provider',
        );
      case 5:
        return const CustomNeumorphism(
          icon: AssetsManager.firebase,
          title: 'Firebase',
        );
      case 6:
        return const CustomNeumorphism(
          icon: AssetsManager.http,
          title: 'Rest Api',
        );
      case 7:
        return const CustomNeumorphism(
          icon: AssetsManager.python,
          title: 'Python',
        );
      case 8:
        return const CustomNeumorphism(
          icon: AssetsManager.laravel,
          title: 'Laravel',
        );
      case 9:
        return const CustomNeumorphism(
          icon: AssetsManager.html,
          title: 'Html',
        );
      case 10:
        return const CustomNeumorphism(
          icon: AssetsManager.css,
          title: 'CSS',
        );
      default:
        return const SizedBox.shrink(); // Empty widget for invalid index
    }
  }
}

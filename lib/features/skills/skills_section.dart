// import 'package:flutter/material.dart';
// import 'package:my_portfolio_flutter/features/skills/neumorphic_widget.dart';
// import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';
// import 'package:visibility_detector/visibility_detector.dart';

// import '../../shared/theme/color_manager.dart';
// import '../../shared/theme/theme_getters.dart';
// import '../../shared/utils/assets_manager.dart';

// class SkillsSection extends StatefulWidget {
//   const SkillsSection({super.key});

//   @override
//   State<SkillsSection> createState() => _SkillsSectionState();
// }

// class _SkillsSectionState extends State<SkillsSection>
//     with TickerProviderStateMixin {
//   late List<AnimationController> _animationControllers;
//   late List<Animation<Offset>> _animations;
//   late List<Animation<double>> _fadeAnimations;
//   @override
//   void initState() {
//     super.initState();
//     // Initialize AnimationControllers for each item
//     _animationControllers = List.generate(11, (index) {
//       return AnimationController(
//         vsync: this,
//         duration: const Duration(milliseconds: 300),
//       );
//     });

//     // Initialize Tweens for each item with different offset animations
//     _animations = List.generate(11, (index) {
//       return Tween<Offset>(
//         begin: Offset((index % 2 == 0) ? -1.0 : 1.0,
//             0.0), // Different angles: left (-1) or right (1)
//         end: Offset.zero,
//       ).animate(CurvedAnimation(
//         parent: _animationControllers[index],
//         curve: Curves.easeInOut,
//       ));
//     });

//     // Initialize Fade Tweens for each item
//     _fadeAnimations = List.generate(11, (index) {
//       return Tween<double>(
//         begin: 0.0,
//         end: 1.0,
//       ).animate(CurvedAnimation(
//         parent: _animationControllers[index],
//         curve: Curves.easeInOut,
//       ));
//     });
//   }

//   @override
//   void dispose() {
//     // Dispose all AnimationControllers
//     for (var controller in _animationControllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   void _startAnimation(int index) {
//     if (!_animationControllers[index].isCompleted) {
//       _animationControllers[index].forward();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return VisibilityDetector(
//       key: const ValueKey('AboutScreenKey'),
//       onVisibilityChanged: (vi) {},
//       child: Container(
//         color: colorScheme(context).secondary,
//         padding: context.responsivePadding(horizontal: 85.33, vertical: 140),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'My Skills',
//               style: textTheme(context).titleMedium?.copyWith(
//                     fontSize: context.responsiveFontSize(64),
//                     color: ColorManager.whiteColor,
//                   ),
//             ),
//             SizedBox(
//               height: context.responsiveHeight(80),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 VisibilityDetector(
//                   key: const Key('item_${0}'),
//                   onVisibilityChanged: (visibility) {
//                     if (visibility.visibleFraction > 0.1) {
//                       _startAnimation(0);
//                     }
//                   },
//                   child: FadeTransition(
//                     opacity: _fadeAnimations[0],
//                     child: SlideTransition(
//                       position: _animations[0],
//                       child: const CustomNeumorphism(
//                         icon: AssetsManager.flutterSvg,
//                         title: 'Flutter',
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: context.responsiveWidth(23),
//                 ),
//                 VisibilityDetector(
//                   key: const Key('item_${1}'),
//                   onVisibilityChanged: (visibility) {
//                     if (visibility.visibleFraction > 0.1) {
//                       _startAnimation(1);
//                     }
//                   },
//                   child: FadeTransition(
//                     opacity: _fadeAnimations[1],
//                     child: SlideTransition(
//                       position: _animations[1],
//                       child: const CustomNeumorphism(
//                         icon: AssetsManager.dartSvg,
//                         title: 'Dart',
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: context.responsiveWidth(23),
//                 ),
//                 VisibilityDetector(
//                   key: const Key('item_${2}'),
//                   onVisibilityChanged: (visibility) {
//                     if (visibility.visibleFraction > 0.1) {
//                       _startAnimation(2);
//                     }
//                   },
//                   child: FadeTransition(
//                     opacity: _fadeAnimations[2],
//                     child: SlideTransition(
//                       position: _animations[2],
//                       child: const CustomNeumorphism(
//                         icon: AssetsManager.git,
//                         title: 'Git',
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: context.responsiveWidth(23),
//                 ),
//                 VisibilityDetector(
//                   key: const Key('item_${3}'),
//                   onVisibilityChanged: (visibility) {
//                     if (visibility.visibleFraction > 0.1) {
//                       _startAnimation(3);
//                     }
//                   },
//                   child: FadeTransition(
//                     opacity: _fadeAnimations[3],
//                     child: SlideTransition(
//                       position: _animations[3],
//                       child: const CustomNeumorphism(
//                         icon: AssetsManager.bloc,
//                         title: 'Bloc',
//                         isIconSvg: false,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: context.responsiveWidth(23),
//                 ),
//                 VisibilityDetector(
//                   key: const Key('item_${4}'),
//                   onVisibilityChanged: (visibility) {
//                     if (visibility.visibleFraction > 0.1) {
//                       _startAnimation(4);
//                     }
//                   },
//                   child: FadeTransition(
//                     opacity: _fadeAnimations[4],
//                     child: SlideTransition(
//                       position: _animations[4],
//                       child: const CustomNeumorphism(
//                         icon: AssetsManager.flutterSvg,
//                         title: 'Provider',
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: context.responsiveWidth(23),
//                 ),
//                 VisibilityDetector(
//                   key: const Key('item_${5}'),
//                   onVisibilityChanged: (visibility) {
//                     if (visibility.visibleFraction > 0.1) {
//                       _startAnimation(5);
//                     }
//                   },
//                   child: FadeTransition(
//                     opacity: _fadeAnimations[5],
//                     child: SlideTransition(
//                       position: _animations[5],
//                       child: const CustomNeumorphism(
//                         icon: AssetsManager.firebase,
//                         title: 'Firebase',
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: context.responsiveHeight(40),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 VisibilityDetector(
//                   key: const Key('item_${6}'),
//                   onVisibilityChanged: (visibility) {
//                     if (visibility.visibleFraction > 0.1) {
//                       _startAnimation(6);
//                     }
//                   },
//                   child: FadeTransition(
//                     opacity: _fadeAnimations[6],
//                     child: SlideTransition(
//                       position: _animations[6],
//                       child: const CustomNeumorphism(
//                         icon: AssetsManager.http,
//                         title: 'Rest Api',
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: context.responsiveWidth(23),
//                 ),
//                 VisibilityDetector(
//                   key: const Key('item_${7}'),
//                   onVisibilityChanged: (visibility) {
//                     if (visibility.visibleFraction > 0.1) {
//                       _startAnimation(7);
//                     }
//                   },
//                   child: FadeTransition(
//                     opacity: _fadeAnimations[7],
//                     child: SlideTransition(
//                       position: _animations[7],
//                       child: const CustomNeumorphism(
//                         icon: AssetsManager.python,
//                         title: 'Python',
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: context.responsiveWidth(23),
//                 ),
//                 VisibilityDetector(
//                   key: const Key('item_${8}'),
//                   onVisibilityChanged: (visibility) {
//                     if (visibility.visibleFraction > 0.1) {
//                       _startAnimation(8);
//                     }
//                   },
//                   child: FadeTransition(
//                     opacity: _fadeAnimations[8],
//                     child: SlideTransition(
//                       position: _animations[8],
//                       child: const CustomNeumorphism(
//                         icon: AssetsManager.laravel,
//                         title: 'Laravel',
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: context.responsiveWidth(23),
//                 ),
//                 VisibilityDetector(
//                   key: const Key('item_${9}'),
//                   onVisibilityChanged: (visibility) {
//                     if (visibility.visibleFraction > 0.1) {
//                       _startAnimation(9);
//                     }
//                   },
//                   child: FadeTransition(
//                     opacity: _fadeAnimations[9],
//                     child: SlideTransition(
//                       position: _animations[9],
//                       child: const CustomNeumorphism(
//                         icon: AssetsManager.html,
//                         title: 'Html',
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: context.responsiveWidth(23),
//                 ),
//                 VisibilityDetector(
//                   key: const Key('item_${10}'),
//                   onVisibilityChanged: (visibility) {
//                     if (visibility.visibleFraction > 0.1) {
//                       _startAnimation(10);
//                     }
//                   },
//                   child: FadeTransition(
//                     opacity: _fadeAnimations[10],
//                     child: SlideTransition(
//                       position: _animations[10],
//                       child: const CustomNeumorphism(
//                         icon: AssetsManager.css,
//                         title: 'CSS',
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio_flutter/features/skills/neumorphic_widget.dart';
import 'package:my_portfolio_flutter/shared/logic/shared_cubit/shared_cubit.dart';
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
          padding: context.responsivePadding(horizontal: 85.33, vertical: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Skills',
                style: textTheme(context).titleMedium?.copyWith(
                      fontSize: context.responsiveFontSize(64),
                      color: ColorManager.whiteColor,
                    ),
              ),
              SizedBox(
                height: context.responsiveHeight(80),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return _buildSkillItem(index);
                }),
              ),
              SizedBox(
                height: context.responsiveHeight(40),
              ),
              Row(
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

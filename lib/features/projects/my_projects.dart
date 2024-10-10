// import 'dart:js' as js;
// import 'dart:math' as math;

// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';

// import '../../shared/theme/color_manager.dart';
// import '../../shared/theme/theme_getters.dart';
// import '../../shared/utils/assets_manager.dart';
// import 'project_card.dart';

// class MyProjectsSection extends StatefulWidget {
//   const MyProjectsSection({
//     super.key,
//     required this.title,
//     this.showGitHubButton = true,
//   });

//   final String title;
//   final bool showGitHubButton;

//   @override
//   State<MyProjectsSection> createState() => _MyProjectsSectionState();
// }

// class _MyProjectsSectionState extends State<MyProjectsSection> {
//   final ValueNotifier<bool> onHovered = ValueNotifier(false);

//   @override
//   void dispose() {
//     onHovered.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: context.responsivePadding(horizontal: 85.33, vertical: 149.33),
//       decoration: const BoxDecoration(color: ColorManager.secondary),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               GradientAnimationText(
//                 text: Text(
//                   widget.title,
//                   style: textTheme(context).titleMedium?.copyWith(
//                         fontSize: context.responsiveFontSize(64),
//                         color: ColorManager.whiteColor,
//                       ),
//                 ),
//                 colors: const [
//                   ColorManager.primary,
//                   ColorManager.secondaryBackground,
//                 ],
//                 duration: const Duration(seconds: 5),
//                 transform: const GradientRotation(math.pi / 4),
//               ),
//               Visibility(
//                 visible: widget.showGitHubButton,
//                 replacement: const SizedBox(),
//                 child: InkWell(
//                   onHover: (value) {
//                     onHovered.value = value;
//                   },
//                   onTap: () {
//                     js.context
//                         .callMethod('open', ['https://github.com/SajanBaisil']);
//                   },
//                   child: ValueListenableBuilder(
//                       valueListenable: onHovered,
//                       builder: (context, value, _) {
//                         return Container(
//                           padding: context.responsivePadding(
//                               horizontal: 21.33, vertical: 13.33),
//                           decoration: BoxDecoration(
//                               color: value
//                                   ? ColorManager.primary
//                                   : ColorManager.secondaryBackground,
//                               borderRadius: BorderRadius.circular(
//                                 context.responsiveRadius(10.667),
//                               )),
//                           child: Row(
//                             children: [
//                               SvgPicture.asset(AssetsManager.globe),
//                               SizedBox(
//                                 width: context.responsiveWidth(16),
//                               ),
//                               Text(
//                                 'Visit My GitHub',
//                                 style: textTheme(context)
//                                     .displaySmall
//                                     ?.copyWith(
//                                         color: ColorManager.whiteColor,
//                                         fontSize:
//                                             context.responsiveFontSize(21.33)),
//                               )
//                             ],
//                           ),
//                         );
//                       }),
//                 ),
//               )
//             ],
//           ),
//           SizedBox(
//             height: context.responsiveHeight(70),
//           ),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 const ProjectCard(),
//                 SizedBox(
//                   width: context.responsiveWidth(42.67),
//                 ),
//                 const ProjectCard(),
//                 SizedBox(
//                   width: context.responsiveWidth(42.67),
//                 ),
//                 const ProjectCard(),
//                 SizedBox(
//                   width: context.responsiveWidth(42.67),
//                 ),
//                 const ProjectCard(),
//                 SizedBox(
//                   width: context.responsiveWidth(42.67),
//                 ),
//                 const ProjectCard(),
//                 SizedBox(
//                   width: context.responsiveWidth(42.67),
//                 ),
//                 const ProjectCard(),
//               ],
//             ).animate(delay: 100.ms).fade(duration: 200.ms).slide(),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'dart:js' as js;
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';

import '../../shared/theme/color_manager.dart';
import '../../shared/theme/theme_getters.dart';
import '../../shared/utils/assets_manager.dart';
import 'project_card.dart';

class MyProjectsSection extends StatefulWidget {
  const MyProjectsSection({
    super.key,
    required this.title,
    this.showGitHubButton = true,
  });

  final String title;
  final bool showGitHubButton;

  @override
  State<MyProjectsSection> createState() => _MyProjectsSectionState();
}

class _MyProjectsSectionState extends State<MyProjectsSection> {
  final ValueNotifier<bool> onHovered = ValueNotifier(false);

  @override
  void dispose() {
    onHovered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.responsivePadding(horizontal: 85.33, vertical: 100),
      decoration: const BoxDecoration(color: ColorManager.secondary),
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
                        fontSize: context.responsiveFontSize(64),
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
                    js.context
                        .callMethod('open', ['https://github.com/SajanBaisil']);
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
                              SvgPicture.asset(AssetsManager.globe),
                              SizedBox(
                                width: context.responsiveWidth(16),
                              ),
                              // Apply animation to the GitHub button text
                              Text(
                                'Visit My GitHub',
                                style: textTheme(context)
                                    .displaySmall
                                    ?.copyWith(
                                        color: ColorManager.whiteColor,
                                        fontSize:
                                            context.responsiveFontSize(21.33)),
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
            height: context.responsiveHeight(70),
          ),
          // Animate the project cards section
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(6, (index) {
                return Animate(
                  effects: [
                    FadeEffect(duration: 300.ms), // Fade-in effect
                  ],
                  child: Row(
                    children: [
                      const ProjectCard(),
                      SizedBox(width: context.responsiveWidth(42.67)),
                    ],
                  ),
                ).animate(
                    delay:
                        (index * 100).ms); // Apply stagger delay for each card
              }),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';

// import '../../shared/theme/theme_getters.dart';
// import '../../shared/utils/assets_manager.dart';

// class ProjectCard extends StatefulWidget {
//   const ProjectCard({
//     super.key,
//   });

//   @override
//   State<ProjectCard> createState() => _ProjectCardState();
// }

// class _ProjectCardState extends State<ProjectCard>
//     with TickerProviderStateMixin {
//   String _mainImageTag = "mainImage";
//   String _mainImage = AssetsManager.placeHolderImage;
//   String _selectedImage = AssetsManager.placeHolderImage;

//   final List<String> _otherImages = [
//     AssetsManager.aboutMeImage,
//     AssetsManager.bloc,
//     AssetsManager.placeHolderImage,
//     AssetsManager.homeScreenImage,
//   ];

//   // Define a boolean to control whether the main image is visible at the top
//   final bool _isMainImageAtTop = false;
//   late Animation<Offset> _animations;
//   late Animation<double> _fadeAnimation;
//   late AnimationController _animationControllers;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize AnimationControllers for each item
//     _animationControllers = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );
//     // Set up the Tween for the fade animation
//     _fadeAnimation = Tween<double>(
//             begin: 1, // Start completely invisible
//             end: 1 // End fully visible
//             )
//         .animate(
//       CurvedAnimation(
//         parent: _animationControllers,
//         curve: Curves.easeIn, // You can change the curve for different effects
//       ),
//     );
//     _animations = Tween<Offset>(
//       begin: const Offset(0, 0), // Different angles: left (-1) or right (1)
//       end: const Offset(0, 0),
//     ).animate(CurvedAnimation(
//       parent: _animationControllers,
//       curve: Curves.easeInOut,
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: context.responsivePadding(horizontal: 20, vertical: 20),
//         width: context.responsiveWidth(554.666),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 colorScheme(context).secondary,
//                 colorScheme(context).secondary.withOpacity(0.3),
//                 Colors.white.withOpacity(0.1),
//                 Colors.white.withOpacity(0.4),
//               ]),
//           border: Border.all(
//             color: Colors.white
//                 .withOpacity(0.1), // Light border to enhance the glass effect
//             width: 2,
//           ),
//           color: colorScheme(context).secondary,
//           borderRadius: BorderRadius.circular(
//             context.responsiveRadius(8),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const ProjectTitleWidget(),
//             SizedBox(
//               height: context.responsiveHeight(10),
//             ),
//             SlideTransition(
//               position: _animations,
//               child: FadeTransition(
//                 opacity: _fadeAnimation,
//                 child: AnimatedCrossFade(
//                   firstCurve: Curves.easeInOut,
//                   secondCurve: Curves.easeInOut,
//                   sizeCurve: Curves.easeInOut,
//                   duration: const Duration(milliseconds: 300),
//                   crossFadeState: _selectedImage == _mainImage
//                       ? CrossFadeState.showSecond
//                       : CrossFadeState.showFirst,
//                   secondChild: ProjectImageSection(
//                     image: _mainImage,
//                   ),
//                   firstChild: ProjectImageSection(
//                     image: _mainImage,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: context.responsiveHeight(10),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: _otherImages
//                   .map((imagePath) => InkWell(
//                         onTap: () {
//                           _swapImages(imagePath);
//                         },
//                         child: AnimatedCrossFade(
//                           duration: const Duration(milliseconds: 300),
//                           crossFadeState: _selectedImage == imagePath
//                               ? CrossFadeState.showSecond
//                               : CrossFadeState.showFirst,
//                           secondChild: ProjectOtherImagesSection(
//                             image: imagePath,
//                           ),
//                           firstChild: ProjectOtherImagesSection(
//                             image: imagePath,
//                           ),
//                         ),
//                       ))
//                   .toList(),
//             ),
//           ],
//         ));
//   }

//   void _swapImages(String tappedImage) {
//     setState(() {
//       // Swap the main image with the tapped image
//       _selectedImage = _mainImage;
//       String temp = _mainImage;
//       _mainImage = tappedImage;
//       _otherImages[_otherImages.indexOf(tappedImage)] = temp;

//       // Swap the tags to maintain the Hero animation consistency
//       _mainImageTag = tappedImage;
//       // Set up the Tween for the fade animation
//       _fadeAnimation = Tween<double>(
//         begin: 0.0, // Start completely invisible
//         end: 1.0, // End fully visible
//       ).animate(
//         CurvedAnimation(
//           parent: _animationControllers,
//           curve:
//               Curves.easeIn, // You can change the curve for different effects
//         ),
//       );
//       _animations = Tween<Offset>(
//         begin: const Offset(0, 0.3), // Different angles: left (-1) or right (1)
//         end: const Offset(0, 0),
//       ).animate(CurvedAnimation(
//         parent: _animationControllers,
//         curve: Curves.easeIn,
//       ));
//       _animationControllers.reset();
//       _animationControllers.forward();
//     });
//   }
// }

// class ProjectOtherImagesSection extends StatelessWidget {
//   const ProjectOtherImagesSection({
//     super.key,
//     required this.image,
//   });

//   final String image;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: context.responsivePadding(horizontal: 10, vertical: 10),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               colorScheme(context).secondary.withOpacity(0.8),
//               colorScheme(context).secondary.withOpacity(0.6),
//               colorScheme(context).secondary.withOpacity(0.4),
//               colorScheme(context).secondary.withOpacity(0.2),
//             ]),
//         border: Border.all(
//           color: Colors.white
//               .withOpacity(0.1), // Light border to enhance the glass effect
//           width: 2,
//         ),
//         color: colorScheme(context).secondary,
//         borderRadius: BorderRadius.circular(
//           context.responsiveRadius(8),
//         ),
//       ),
//       child: Image.asset(
//         image,
//         height: context.responsiveHeight(100),
//         width: context.responsiveWidth(95),
//       ),
//     );
//   }
// }

// class ProjectImageSection extends StatelessWidget {
//   const ProjectImageSection({
//     super.key,
//     required this.image,
//   });
//   final String image;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: Colors.white
//               .withOpacity(0.1), // Light border to enhance the glass effect
//           width: 2,
//         ),
//         color: colorScheme(context).secondary,
//         borderRadius: BorderRadius.circular(
//           context.responsiveRadius(8),
//         ),
//       ),
//       child: Image.asset(
//         image,
//         height: context.responsiveHeight(400),
//         width: context.responsiveWidth(554.666),
//       ),
//     );
//   }
// }

// class ProjectTitleWidget extends StatelessWidget {
//   const ProjectTitleWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: context.responsivePadding(horizontal: 30, vertical: 10),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               colorScheme(context).secondary,
//               Colors.white.withOpacity(0.1),
//             ]),
//         border: Border.all(
//           color: Colors.white
//               .withOpacity(0.1), // Light border to enhance the glass effect
//           width: 2,
//         ),
//         color: colorScheme(context).secondary,
//         borderRadius: BorderRadius.circular(
//           context.responsiveRadius(30),
//         ),
//       ),
//       child: Text(
//         'Easify',
//         style: textTheme(context).titleMedium?.copyWith(
//             fontSize: context.responsiveFontSize(18),
//             color: colorScheme(context).onSecondary),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';

import '../../shared/theme/theme_getters.dart';
import '../../shared/utils/assets_manager.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    super.key,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with TickerProviderStateMixin {
  String _mainImage = AssetsManager.placeHolderImage;
  final String _selectedImage = AssetsManager.placeHolderImage;

  final List<String> _otherImages = [
    AssetsManager.aboutMeImage,
    AssetsManager.bloc,
    AssetsManager.placeHolderImage,
    AssetsManager.homeScreenImage,
  ];

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.responsivePadding(horizontal: 20, vertical: 20),
      width: context.responsiveWidth(554.666),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme(context).secondary,
            colorScheme(context).secondary.withOpacity(0.3),
            Colors.white.withOpacity(0.1),
            Colors.white.withOpacity(0.4),
          ],
        ),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 2,
        ),
        color: colorScheme(context).secondary,
        borderRadius: BorderRadius.circular(
          context.responsiveRadius(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProjectTitleWidget()
              .animate()
              .fadeIn(duration: 400.ms)
              .slideY(begin: -0.2, end: 0.0), // Title fade & slide animation
          SizedBox(height: context.responsiveHeight(10)),
          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: AnimatedCrossFade(
                duration: const Duration(milliseconds: 300),
                crossFadeState: _selectedImage == _mainImage
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                secondChild: ProjectImageSection(
                  image: _mainImage,
                ),
                firstChild: ProjectImageSection(
                  image: _mainImage,
                ),
              ),
            ),
          ),
          SizedBox(height: context.responsiveHeight(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _otherImages.map((imagePath) {
              return InkWell(
                onTap: () {
                  _swapImages(imagePath);
                },
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  crossFadeState: _selectedImage == imagePath
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  secondChild: ProjectOtherImagesSection(image: imagePath),
                  firstChild: ProjectOtherImagesSection(image: imagePath),
                ).animate().fadeIn(duration: 300.ms), // Smooth image fade-in
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  void _swapImages(String tappedImage) {
    setState(() {
      String temp = _mainImage;
      _mainImage = tappedImage;
      _otherImages[_otherImages.indexOf(tappedImage)] = temp;
      _animationController.reset();
      _animationController.forward();
    });
  }
}

class ProjectOtherImagesSection extends StatelessWidget {
  const ProjectOtherImagesSection({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.responsivePadding(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme(context).secondary.withOpacity(0.8),
            colorScheme(context).secondary.withOpacity(0.6),
            colorScheme(context).secondary.withOpacity(0.4),
            colorScheme(context).secondary.withOpacity(0.2),
          ],
        ),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(
          context.responsiveRadius(8),
        ),
      ),
      child: Image.asset(
        image,
        height: context.responsiveHeight(100),
        width: context.responsiveWidth(95),
      ).animate().fadeIn(duration: 300.ms), // Smooth fade-in for images
    );
  }
}

class ProjectImageSection extends StatelessWidget {
  const ProjectImageSection({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(
          context.responsiveRadius(8),
        ),
      ),
      child: Image.asset(
        image,
        height: context.responsiveHeight(400),
        width: context.responsiveWidth(554.666),
      ).animate().fadeIn(duration: 500.ms), // Main image fade-in effect
    );
  }
}

class ProjectTitleWidget extends StatelessWidget {
  const ProjectTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.responsivePadding(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme(context).secondary,
            Colors.white.withOpacity(0.1),
          ],
        ),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(
          context.responsiveRadius(30),
        ),
      ),
      child: Text(
        'Easify',
        style: textTheme(context).titleMedium?.copyWith(
              fontSize: context.responsiveFontSize(18),
              color: colorScheme(context).onSecondary,
            ),
      ),
    );
  }
}

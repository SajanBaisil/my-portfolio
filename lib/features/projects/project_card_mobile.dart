import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio_flutter/shared/utils/device_utils.dart';
import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';

import '../../shared/theme/theme_getters.dart';
import '../../shared/utils/assets_manager.dart';

class ProjectCardMobile extends StatefulWidget {
  const ProjectCardMobile({
    super.key,
  });

  @override
  State<ProjectCardMobile> createState() => _ProjectCardMobileState();
}

class _ProjectCardMobileState extends State<ProjectCardMobile>
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
      width: DeviceUtils(context).isMobile
          ? 1300.w
          : context.responsiveWidth(554.666),
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
          10.r,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProjectTitleWidget()
              .animate()
              .fadeIn(duration: 400.ms)
              .slideY(begin: -0.2, end: 0.0), // Title fade & slide animation
          SizedBox(height: 10.h),
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
        height: 300.h,
        width: 554.66.w,
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
      padding: DeviceUtils(context).isMobile
          ? EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h)
          : context.responsivePadding(horizontal: 30, vertical: 10),
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
          DeviceUtils(context).isMobile ? 20 : context.responsiveRadius(30),
        ),
      ),
      child: Text(
        'Easify',
        style: textTheme(context).titleMedium?.copyWith(
              fontSize: DeviceUtils(context).isMobile
                  ? 12.sp
                  : context.responsiveFontSize(18),
              color: colorScheme(context).onSecondary,
            ),
      ),
    );
  }
}

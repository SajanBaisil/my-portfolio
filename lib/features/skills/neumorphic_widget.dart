import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio_flutter/shared/theme/color_manager.dart';
import 'package:my_portfolio_flutter/shared/theme/theme_getters.dart';
import 'package:my_portfolio_flutter/shared/utils/device_utils.dart';
import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';

class CustomNeumorphism extends StatelessWidget {
  final double borderRadius;
  final double blurRadius;
  final double spreadRadius;
  final Color color;
  final Offset offset;
  final String icon;
  final String title;
  final bool isIconSvg;

  const CustomNeumorphism({
    super.key,
    this.borderRadius = 12.0,
    this.blurRadius = 15.0,
    this.spreadRadius = 1.0,
    this.color = ColorManager.whiteColor,
    this.offset = const Offset(4, 4),
    required this.icon,
    required this.title,
    this.isIconSvg = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          DeviceUtils(context).isMobile ? 400.w : context.responsiveWidth(180),
      padding: context.responsivePadding(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.black
            .withOpacity(0.3), // Black color with opacity for glassy effect
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: Colors.white
              .withOpacity(0.1), // Light border to enhance the glass effect
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Subtle shadow for depth
            offset: const Offset(6, 6),
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
          ),
          BoxShadow(
            color: Colors.white
                .withOpacity(0.1), // Light highlight for a lifted effect
            offset: const Offset(-6, -6),
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
          ),
        ],
        // Using a combination of backdrop filter and other effects to create the frosted glass effect
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.1),
            Colors.white.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 10.0, sigmaY: 10.0), // Frosted blur effect
          child: Column(
            children: [
              isIconSvg
                  ? SvgPicture.asset(
                      icon,
                      height: context.responsiveHeight(83),
                    )
                  : Image.asset(
                      icon,
                      height: context.responsiveHeight(83),
                    ),
              SizedBox(
                height: context.responsiveHeight(25),
              ),
              Text(
                title,
                style: textTheme(context).titleMedium?.copyWith(
                      fontSize: DeviceUtils(context).isMobile
                          ? 16.sp
                          : context.responsiveFontSize(23),
                      color: ColorManager.whiteColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

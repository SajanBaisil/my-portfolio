import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio_flutter/shared/theme/theme_getters.dart';
import 'package:my_portfolio_flutter/shared/utils/device_utils.dart';
import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';

import '../../shared/theme/color_manager.dart';
import '../../shared/utils/assets_manager.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.secondary,
          border: Border.all(
            color: ColorManager.secondary,
          )),
      padding: context.responsivePadding(horizontal: 85.33, vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Copyright© 2024 Sajan Baisil. All Rights Reserved.',
            style: textTheme(context).labelSmall?.copyWith(
                color: ColorManager.whiteColor,
                fontSize: DeviceUtils(context).isMobile ? 10.sp : null),
          ),
          Row(
            children: [
              InkWell(
                  hoverColor: ColorManager.whiteColor,
                  borderRadius:
                      BorderRadius.circular(context.responsiveRadius(8)),
                  onTap: () {
                    js.context.callMethod('open', [
                      'https://www.facebook.com/profile.php?id=100006542688441'
                    ]);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(context.responsiveRadius(10)),
                    child: SvgPicture.asset(
                      AssetsManager.facebook,
                      height: DeviceUtils(context).isMobile ? 20.sp : null,
                      color: ColorManager.whiteColor,
                    ),
                  )).animate().fadeIn(duration: 800.ms),
              SizedBox(
                width: context.responsiveWidth(16),
              ),
              InkWell(
                  hoverColor: ColorManager.bgShade,
                  borderRadius:
                      BorderRadius.circular(context.responsiveRadius(8)),
                  onTap: () {
                    js.context.callMethod('open',
                        ['https://www.instagram.com/sajanbaisil/?next=%2F']);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(context.responsiveRadius(10)),
                    child: SvgPicture.asset(
                      AssetsManager.instagram,
                      height: DeviceUtils(context).isMobile ? 20.sp : null,
                      color: ColorManager.whiteColor,
                    ),
                  )).animate().fadeIn(duration: 800.ms),
              SizedBox(
                width: context.responsiveWidth(16),
              ),
              InkWell(
                  hoverColor: ColorManager.bgShade,
                  borderRadius:
                      BorderRadius.circular(context.responsiveRadius(8)),
                  onTap: () {
                    js.context.callMethod('open', [
                      'https://www.linkedin.com/in/sajan-baisil-18759a210/'
                    ]);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(context.responsiveRadius(10)),
                    child: SvgPicture.asset(
                      AssetsManager.linkedin,
                      color: ColorManager.whiteColor,
                      height: DeviceUtils(context).isMobile ? 20.sp : null,
                    ),
                  )).animate().fadeIn(duration: 800.ms),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio_flutter/shared/theme/theme_getters.dart';

import '../../shared/theme/color_manager.dart';

class AppBarBottomMobile extends StatelessWidget {
  const AppBarBottomMobile({
    super.key,
    required this.width,
    required this.isExpanded,
  });

  final double width;
  final ValueNotifier<bool> isExpanded;

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapOutside: (event) {
        isExpanded.value = false;
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            color: ColorManager.secondary,
            width: width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                ActionItemsAppBar(
                  isExpanded: isExpanded,
                  title: 'Home',
                ),
                SizedBox(height: 13.h),
                ActionItemsAppBar(
                  isExpanded: isExpanded,
                  title: 'About',
                ),
                SizedBox(height: 13.h),
                ActionItemsAppBar(
                  isExpanded: isExpanded,
                  title: 'Projects',
                ),
                SizedBox(height: 13.h),
                ActionItemsAppBar(
                  isExpanded: isExpanded,
                  title: 'Skills',
                ),
                SizedBox(height: 13.h),
                ActionItemsAppBar(
                  isExpanded: isExpanded,
                  title: 'Blogs',
                ),
                SizedBox(height: 13.h),
                ActionItemsAppBar(
                  isExpanded: isExpanded,
                  title: 'Contact Me',
                ),
                SizedBox(height: 13.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ActionItemsAppBar extends StatelessWidget {
  const ActionItemsAppBar({
    super.key,
    required this.isExpanded,
    required this.title,
  });

  final ValueNotifier<bool> isExpanded;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isExpanded.value = false;
      },
      child: Text(
        title,
        style: textTheme(context)
            .labelSmall
            ?.copyWith(color: ColorManager.whiteColor),
      ),
    );
  }
}

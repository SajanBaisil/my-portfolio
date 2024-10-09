import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/shared/theme/color_manager.dart';
import 'package:my_portfolio_flutter/shared/theme/theme_getters.dart';
import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';
import 'package:my_portfolio_flutter/shared/utils/type_def.dart';

class AppBarTitleWidget extends StatefulWidget {
  const AppBarTitleWidget({
    super.key,
    required this.home,
    required this.about,
    required this.projects,
    required this.skills,
    required this.blogs,
  });

  final OnTapCallback home;
  final OnTapCallback about;
  final OnTapCallback projects;
  final OnTapCallback skills;
  final OnTapCallback blogs;

  @override
  State<AppBarTitleWidget> createState() => _AppBarTitleWidgetState();
}

class _AppBarTitleWidgetState extends State<AppBarTitleWidget> {
  final ValueNotifier<bool> onHoveredHome = ValueNotifier(false);
  final ValueNotifier<bool> onHoveredAboutMe = ValueNotifier(false);
  final ValueNotifier<bool> onHoveredProjects = ValueNotifier(false);
  final ValueNotifier<bool> onHoveredSkills = ValueNotifier(false);
  final ValueNotifier<bool> onHoveredBlogs = ValueNotifier(false);

  @override
  void dispose() {
    onHoveredHome.dispose();
    onHoveredAboutMe.dispose();
    onHoveredProjects.dispose();
    onHoveredSkills.dispose();
    onHoveredBlogs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MouseRegion(
          onExit: (event) {
            onHoveredHome.value = false;
          },
          onEnter: (event) {
            onHoveredHome.value = true;
          },
          child: ValueListenableBuilder(
              valueListenable: onHoveredHome,
              builder: (context, value, _) {
                return InkWell(
                  onTap: widget.home,
                  child: Text(
                    'Home',
                    style: textTheme(context).titleSmall?.copyWith(
                        fontSize: context.responsiveFontSize(21.33),
                        color: value
                            ? ColorManager.primary
                            : ColorManager.whiteColor),
                  ),
                );
              }),
        ),
        SizedBox(
          width: context.responsiveWidth(42.67),
        ),
        MouseRegion(
          onExit: (event) {
            onHoveredAboutMe.value = false;
          },
          onEnter: (event) {
            onHoveredAboutMe.value = true;
          },
          child: ValueListenableBuilder(
              valueListenable: onHoveredAboutMe,
              builder: (context, value, _) {
                return InkWell(
                  onTap: widget.about,
                  child: Text(
                    'About Me',
                    style: textTheme(context).titleSmall?.copyWith(
                        fontSize: context.responsiveFontSize(21.33),
                        color: value
                            ? ColorManager.primary
                            : ColorManager.whiteColor),
                  ),
                );
              }),
        ),
        SizedBox(
          width: context.responsiveWidth(42.67),
        ),
        MouseRegion(
          onExit: (event) {
            onHoveredProjects.value = false;
          },
          onEnter: (event) {
            onHoveredProjects.value = true;
          },
          child: ValueListenableBuilder(
              valueListenable: onHoveredProjects,
              builder: (context, value, _) {
                return InkWell(
                  onTap: widget.projects,
                  child: Text(
                    'Projects',
                    style: textTheme(context).titleSmall?.copyWith(
                        fontSize: context.responsiveFontSize(21.33),
                        color: value
                            ? ColorManager.primary
                            : ColorManager.whiteColor),
                  ),
                );
              }),
        ),
        SizedBox(
          width: context.responsiveWidth(42.67),
        ),
        MouseRegion(
          onExit: (event) {
            onHoveredSkills.value = false;
          },
          onEnter: (event) {
            onHoveredSkills.value = true;
          },
          child: ValueListenableBuilder(
              valueListenable: onHoveredSkills,
              builder: (context, value, _) {
                return InkWell(
                  onTap: widget.skills,
                  child: Text(
                    'Skills',
                    style: textTheme(context).titleSmall?.copyWith(
                        fontSize: context.responsiveFontSize(21.33),
                        color: value
                            ? ColorManager.primary
                            : ColorManager.whiteColor),
                  ),
                );
              }),
        ),
        SizedBox(
          width: context.responsiveWidth(42.67),
        ),
        MouseRegion(
          onExit: (event) {
            onHoveredBlogs.value = false;
          },
          onEnter: (event) {
            onHoveredBlogs.value = true;
          },
          child: ValueListenableBuilder(
              valueListenable: onHoveredBlogs,
              builder: (context, value, _) {
                return InkWell(
                  onTap: widget.blogs,
                  child: Text(
                    'Blogs',
                    style: textTheme(context).titleSmall?.copyWith(
                        fontSize: context.responsiveFontSize(21.33),
                        color: value
                            ? ColorManager.primary
                            : ColorManager.whiteColor),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/features/about/about_me.dart';
import 'package:my_portfolio_flutter/features/skills/skills_section.dart';
import 'package:my_portfolio_flutter/shared/theme/color_manager.dart';
import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';

import 'contact-me/contact_me_section.dart';
import 'footer/footer_section.dart';
import 'home/home_section.dart';
import 'projects/my_projects.dart';
import 'widgets/app_bar_title_widget.dart';
import 'widgets/contact_me_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Define ScrollController
  final ScrollController _scrollController = ScrollController();

  // Define GlobalKeys for each section
  final GlobalKey section1Key = GlobalKey();
  final GlobalKey section2Key = GlobalKey();
  final GlobalKey section3Key = GlobalKey();
  final GlobalKey section4Key = GlobalKey();
  final GlobalKey section5Key = GlobalKey();
  final GlobalKey section6Key = GlobalKey();

  // Scroll to a specific section using the key
  void _scrollToSection(GlobalKey sectionKey) {
    Scrollable.ensureVisible(
      sectionKey.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: ColorManager.secondary,
            pinned: true,
            toolbarHeight: context.responsiveHeight(120),
            centerTitle: true,
            title: AppBarTitleWidget(
              home: () => _scrollToSection(section1Key),
              about: () => _scrollToSection(section2Key),
              projects: () => _scrollToSection(section3Key),
              skills: () => _scrollToSection(section4Key),
              blogs: () => _scrollToSection(section5Key),
            ),
            actions: [
              /// contact me button
              ContactMeButton(
                contact: () => _scrollToSection(section6Key),
                key: section6Key,
              ),
              SizedBox(
                width: context.responsiveWidth(85.33),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                /// home section
                HomeSectionWidget(
                  key: section1Key,
                ),

                /// about section
                AboutMeSection(
                  key: section2Key,
                ),

                /// my projects
                MyProjectsSection(
                  key: section3Key,
                  title: 'My Projects',
                ),

                /// skills
                SkillsSection(
                  key: section4Key,
                ),

                /// blog section
                MyProjectsSection(
                  title: 'Blogs',
                  showGitHubButton: false,
                  key: section5Key,
                ),

                ///contact me section
                ContactMeSection(
                  key: section6Key,
                ),

                /// footer
                const FooterSection()
              ],
            ),
          )
        ],
      ),
    );
  }
}

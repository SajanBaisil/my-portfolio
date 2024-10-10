import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio_flutter/features/about/about_me.dart';
import 'package:my_portfolio_flutter/features/skills/skills_section.dart';
import 'package:my_portfolio_flutter/shared/logic/shared_cubit/shared_cubit.dart';
import 'package:my_portfolio_flutter/shared/theme/color_manager.dart';
import 'package:my_portfolio_flutter/shared/utils/enums.dart';
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

  //// Scroll to a specific section using the key
  // void _scrollToSection(GlobalKey sectionKey) {
  //   Scrollable.ensureVisible(
  //     sectionKey.currentContext!,
  //     duration: const Duration(milliseconds: 500),
  //     curve: Curves.easeInOut,
  //   );
  // }
  // Scroll to a specific section using the GlobalKey's position in the list
  void _scrollToSection(
    GlobalKey sectionKey,
  ) {
    final context = sectionKey.currentContext;
    if (context != null) {
      // Get the position of the widget and use the ScrollController to scroll to it
      final box = context.findRenderObject() as RenderBox;
      final position =
          box.localToGlobal(Offset.zero, ancestor: context.findRenderObject());

      _scrollController.animateTo(
        _scrollController.offset + position.dy,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: ColorManager.secondary,
            pinned: true,
            toolbarHeight: context.responsiveHeight(120),
            centerTitle: true,
            title: AppBarTitleWidget(
              home: () {
                _scrollToSection(section1Key);
                setSelectedSection(context,
                    selectedSection: SelectedSection.home);
              },
              about: () {
                _scrollToSection(section2Key);
                setSelectedSection(context,
                    selectedSection: SelectedSection.aboutMe);
              },
              projects: () {
                _scrollToSection(section3Key);
                setSelectedSection(context,
                    selectedSection: SelectedSection.projects);
              },
              skills: () {
                _scrollToSection(section4Key);
                setSelectedSection(context,
                    selectedSection: SelectedSection.skills);
              },
              blogs: () {
                _scrollToSection(section5Key);
                setSelectedSection(context,
                    selectedSection: SelectedSection.blogs);
              },
            ),
            actions: [
              /// contact me button
              ContactMeButton(
                contact: () {
                  _scrollToSection(section6Key);
                  setSelectedSection(context,
                      selectedSection: SelectedSection.contact);
                },
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

  void setSelectedSection(BuildContext context,
      {required SelectedSection selectedSection}) {
    context
        .read<SharedCubit>()
        .setSelectedSection(selectedSection: selectedSection);
  }
}

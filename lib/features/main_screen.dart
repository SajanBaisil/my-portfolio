// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_portfolio_flutter/features/about/about_me.dart';
// import 'package:my_portfolio_flutter/features/skills/skills_section.dart';
// import 'package:my_portfolio_flutter/shared/logic/shared_cubit/shared_cubit.dart';
// import 'package:my_portfolio_flutter/shared/theme/color_manager.dart';
// import 'package:my_portfolio_flutter/shared/utils/enums.dart';
// import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';

// import 'contact-me/contact_me_section.dart';
// import 'footer/footer_section.dart';
// import 'home/home_section.dart';
// import 'projects/my_projects.dart';
// import 'widgets/app_bar_title_widget.dart';
// import 'widgets/contact_me_button.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   // Define ScrollController
//   final ScrollController _scrollController = ScrollController();

//   // Define GlobalKeys for each section
//   final GlobalKey section1Key = GlobalKey();
//   final GlobalKey section2Key = GlobalKey();
//   final GlobalKey section3Key = GlobalKey();
//   final GlobalKey section4Key = GlobalKey();
//   final GlobalKey section5Key = GlobalKey();
//   final GlobalKey section6Key = GlobalKey();

//   //// Scroll to a specific section using the key
//   // void _scrollToSection(GlobalKey sectionKey) {
//   //   Scrollable.ensureVisible(
//   //     sectionKey.currentContext!,
//   //     duration: const Duration(milliseconds: 500),
//   //     curve: Curves.easeInOut,
//   //   );
//   // }
//   // Scroll to a specific section using the GlobalKey's position in the list
//   void _scrollToSection(
//     GlobalKey sectionKey,
//   ) {
//     final context = sectionKey.currentContext;
//     if (context != null) {
//       // Get the position of the widget and use the ScrollController to scroll to it
//       final box = context.findRenderObject() as RenderBox;
//       final position =
//           box.localToGlobal(Offset.zero, ancestor: context.findRenderObject());

//       _scrollController.animateTo(
//         _scrollController.offset + position.dy,
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         controller: _scrollController,
//         slivers: [
//           SliverAppBar(
//             backgroundColor: ColorManager.secondary,
//             pinned: true,
//             toolbarHeight: context.responsiveHeight(120),
//             centerTitle: true,
//             title: AppBarTitleWidget(
//               home: () {
//                 _scrollToSection(section1Key);
//                 setSelectedSection(context,
//                     selectedSection: SelectedSection.home);
//               },
//               about: () {
//                 _scrollToSection(section2Key);
//                 setSelectedSection(context,
//                     selectedSection: SelectedSection.aboutMe);
//               },
//               projects: () {
//                 _scrollToSection(section3Key);
//                 setSelectedSection(context,
//                     selectedSection: SelectedSection.projects);
//               },
//               skills: () {
//                 _scrollToSection(section4Key);
//                 setSelectedSection(context,
//                     selectedSection: SelectedSection.skills);
//               },
//               blogs: () {
//                 _scrollToSection(section5Key);
//                 setSelectedSection(context,
//                     selectedSection: SelectedSection.blogs);
//               },
//             ),
//             actions: [
//               /// contact me button
//               ContactMeButton(
//                 contact: () {
//                   _scrollToSection(section6Key);
//                   setSelectedSection(context,
//                       selectedSection: SelectedSection.contact);
//                 },
//               ),
//               SizedBox(
//                 width: context.responsiveWidth(85.33),
//               )
//             ],
//           ),
//           SliverList(
//             delegate: SliverChildListDelegate(
//               [
//                 /// home section
//                 HomeSectionWidget(
//                   key: section1Key,
//                 ),

//                 /// about section
//                 AboutMeSection(
//                   key: section2Key,
//                 ),

//                 /// my projects
//                 MyProjectsSection(
//                   key: section3Key,
//                   title: 'My Projects',
//                 ),

//                 /// skills
//                 SkillsSection(
//                   key: section4Key,
//                 ),

//                 /// blog section
//                 MyProjectsSection(
//                   title: 'Blogs',
//                   showGitHubButton: false,
//                   key: section5Key,
//                 ),

//                 ///contact me section
//                 ContactMeSection(
//                   key: section6Key,
//                 ),

//                 /// footer
//                 const FooterSection()
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   void setSelectedSection(BuildContext context,
//       {required SelectedSection selectedSection}) {
//     context
//         .read<SharedCubit>()
//         .setSelectedSection(selectedSection: selectedSection);
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio_flutter/features/about/about_section_mobile.dart';
import 'package:my_portfolio_flutter/features/contact-me/contact_me_mobile_section.dart';
import 'package:my_portfolio_flutter/features/home/home_section_mobile.dart';
import 'package:my_portfolio_flutter/features/widgets/appbar_mobile.dart';
import 'package:my_portfolio_flutter/shared/logic/shared_cubit/shared_cubit.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../shared/theme/color_manager.dart';
import '../shared/utils/device_utils.dart';
import '../shared/utils/enums.dart';
import 'about/about_me.dart';
import 'contact-me/contact_me_section.dart';
import 'footer/footer_section.dart';
import 'home/home_section.dart';
import 'projects/my_projects.dart';
import 'skills/skills_section.dart';
import 'widgets/app_bar_title_widget.dart';
import 'widgets/contact_me_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  AutoScrollController? _autoScrollController;
  final scrollDirection = Axis.vertical;
  final scfKey = GlobalKey<ScaffoldState>();
  AnimationController? controller;
  Animation<double>? sizeAnimation;
  final ValueNotifier<bool> _isExpanded = ValueNotifier(false);

  // Scroll to a specific section using the GlobalKey's position in the list
  void _scrollToSection(int index) async {
    await _autoScrollController!.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin,
        duration: const Duration(milliseconds: 500));
  }

  @override
  void initState() {
    super.initState();
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    );
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    sizeAnimation = Tween<double>(begin: 0, end: 180)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scfKey,
      body: CustomScrollView(
        shrinkWrap: true,
        controller: _autoScrollController,
        slivers: [
          DeviceUtils(context).isMobile
              ? AnimatedBuilder(
                  animation: sizeAnimation!,
                  builder: (context, _) {
                    return ValueListenableBuilder(
                        valueListenable: _isExpanded,
                        builder: (context, isExpanded, _) {
                          return SliverAppBar(
                            backgroundColor: ColorManager.secondary,
                            pinned: true,
                            actions: [
                              AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: !isExpanded
                                    ? InkWell(
                                        onTap: () {
                                          _handleOnTapMenu(isExpanded);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(10.r),
                                          child: const Icon(
                                            Icons.menu,
                                            color: ColorManager.whiteColor,
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ),
                              SizedBox(
                                width: 30.sp,
                              )
                            ],
                            bottom: isExpanded
                                ? PreferredSize(
                                    preferredSize: Size(width, 177.h),
                                    child: AppBarBottomMobile(
                                      width: width,
                                      isExpanded: _isExpanded,
                                    ))
                                : const PreferredSize(
                                    preferredSize: Size(0, 0),
                                    child: SizedBox()),
                          );
                        });
                  })
              : SliverAppBar(
                  key: const ValueKey('appBar'),
                  backgroundColor: ColorManager.secondary,
                  pinned: true,
                  toolbarHeight: 120.sp,
                  centerTitle: true,
                  title: AppBarTitleWidget(
                    home: () {
                      _scrollToSection(0);
                      setSelectedSection(context,
                          selectedSection: SelectedSection.home);
                    },
                    about: () {
                      _scrollToSection(1);
                      setSelectedSection(context,
                          selectedSection: SelectedSection.aboutMe);
                    },
                    projects: () {
                      _scrollToSection(2);
                      setSelectedSection(context,
                          selectedSection: SelectedSection.projects);
                    },
                    skills: () {
                      _scrollToSection(3);
                      setSelectedSection(context,
                          selectedSection: SelectedSection.skills);
                    },
                    blogs: () {
                      _scrollToSection(4);
                      setSelectedSection(context,
                          selectedSection: SelectedSection.blogs);
                    },
                  ),
                  actions: [
                    /// contact me button
                    ContactMeButton(
                      contact: () {
                        _scrollToSection(
                            5); // Use section6Key for ContactMeSection
                        setSelectedSection(context,
                            selectedSection: SelectedSection.contact);
                      },
                    ),
                    SizedBox(
                      width: 85.33.sp,
                    )
                  ],
                ),
          SliverList(
            key: const ValueKey('list'),
            delegate: SliverChildListDelegate(
              [
                /// home section
                DeviceUtils(context).isMobile
                    ? HomeSectionWidgetMobile(
                        index: 0,
                        controller: _autoScrollController,
                      )
                    : HomeSectionWidget(
                        index: 0,
                        controller: _autoScrollController,
                      ),

                /// about section
                DeviceUtils(context).isMobile
                    ? AboutSectionMobile(
                        index: 1,
                        controller: _autoScrollController,
                      )
                    : AboutMeSection(
                        index: 1,
                        controller: _autoScrollController,
                      ),

                /// my projects
                MyProjectsSection(
                  title: 'My Projects',
                  index: 2,
                  controller: _autoScrollController,
                ),

                /// skills
                SkillsSection(
                  index: 3,
                  controller: _autoScrollController,
                ),

                /// blog section
                MyProjectsSection(
                  title: 'Blogs',
                  showGitHubButton: false,
                  index: 4,
                  isBlog: true,
                  controller: _autoScrollController,
                ),

                ///contact me section
                DeviceUtils(context).isMobile
                    ? ContactMeSectionMobile(
                        index: 5,
                        controller: _autoScrollController,
                      )
                    : ContactMeSection(
                        index: 5,
                        controller: _autoScrollController,
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

  void _handleOnTapMenu(bool isExpanded) {
    _isExpanded.value = !isExpanded;
  }

  void setSelectedSection(BuildContext context,
      {required SelectedSection selectedSection}) {
    context
        .read<SharedCubit>()
        .setSelectedSection(selectedSection: selectedSection);
  }
}

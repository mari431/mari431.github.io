import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appcolors.dart';
import 'package:marimuthu_portfolio/constants/size.dart';
import 'package:marimuthu_portfolio/controllers/ShowcaseController.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/screens/ContactPage.dart';
import 'package:marimuthu_portfolio/screens/HomePage.dart';
import 'package:marimuthu_portfolio/screens/ServicesPage.dart';
import 'package:marimuthu_portfolio/screens/aboutPage.dart';
import 'package:marimuthu_portfolio/screens/companyIWorked.dart';
import 'package:marimuthu_portfolio/screens/skillsPage.dart';
import 'package:marimuthu_portfolio/widgets/drawer_mobile.dart';
import 'package:marimuthu_portfolio/widgets/footer.dart';
import 'package:marimuthu_portfolio/widgets/header_desktop.dart';
import 'package:marimuthu_portfolio/widgets/header_mobile.dart';
import 'package:marimuthu_portfolio/widgets/projects_section.dart';

import 'certificate/views/CertificateView.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  bool _showBackToTop = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final ThemeController _themeController = Get.find<ThemeController>();
  final List<GlobalKey> navbarKeys = List.generate(7, (_) => GlobalKey());

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showcaseController = Get.put(ShowcaseController());

    return LayoutBuilder(
      builder: (context, constraints) {
        final useDesktopNavigation =
            constraints.maxWidth >= kMinDesktopNavbarWidth;

        return Obx(() => Scaffold(
          key: scaffoldKey,
          backgroundColor:
              AppColors.homeMainBgColor(_themeController.isDarkMode.value),
          floatingActionButton: IgnorePointer(
            ignoring: !_showBackToTop,
            child: AnimatedScale(
              scale: _showBackToTop ? 1 : 0,
              duration: const Duration(milliseconds: 260),
              curve: Curves.easeOutBack,
              child: AnimatedOpacity(
                opacity: _showBackToTop ? 1 : 0,
                duration: const Duration(milliseconds: 180),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12, right: 8),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(18),
                    elevation: 12,
                    shadowColor: const Color(0xFF6D5DFB).withOpacity(.35),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: () => scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 850),
                        curve: Curves.easeInOutCubic,
                      ),
                      child: Ink(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF7C6CFF), Color(0xFF3977F6)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: Colors.white.withOpacity(.24)),
                        ),
                        child: const Icon(
                          Icons.keyboard_double_arrow_up_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          endDrawer: useDesktopNavigation
              ? null
              : DrawerMobile(
                  onNavItemTap: (navIndex) {
                    scaffoldKey.currentState?.closeEndDrawer();
                    scrollToSection(navIndex);
                  },
                ),
          body: Column(
            children: [
              if (useDesktopNavigation)
                HeaderDesktop(onNavMenuTap: scrollToSection)
              else
                HeaderMobile(
                  onLogoTap: () => scrollToSection(0),
                  onMenuTap: () => scaffoldKey.currentState?.openEndDrawer(),
                ),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification is ScrollUpdateNotification) {
                      final offset = notification.metrics.pixels;
                      showcaseController.onScroll(offset);
                      final shouldShow = offset > 420;
                      if (shouldShow != _showBackToTop && mounted) {
                        setState(() => _showBackToTop = shouldShow);
                      }
                    }
                    return false;
                  },
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        KeyedSubtree(
                          key: navbarKeys[0],
                          child: HomePage(
                            onViewProjects: () => scrollToSection(3),
                            onContactTap: () => scrollToSection(5),
                          ),
                        ),
                        KeyedSubtree(
                          key: navbarKeys[1],
                          child: AboutPage(),
                        ),
                        ServicesPage(),
                        KeyedSubtree(
                          key: navbarKeys[3],
                          child: ProjectsSection(),
                        ),
                        KeyedSubtree(
                          key: navbarKeys[2],
                          child: SkillsPage(),
                        ),
                        // Keep one contact destination; social links live in ContactScreen.
                        KeyedSubtree(
                          key: navbarKeys[6],
                          child: CertificateView(),
                        ),
                        CompanyIWorked(),
                        KeyedSubtree(
                          key: navbarKeys[5],
                          child: ContactScreen(),
                        ),
                        Footer(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
      },
    );
  }

  void scrollToSection(int navIndex) {
    // Index 4 belonged to the retired sample-video section.
    if (navIndex == 4 || navIndex < 0 || navIndex >= navbarKeys.length) return;

    final targetContext = navbarKeys[navIndex].currentContext;
    if (targetContext == null) return;

    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
    );
  }
}

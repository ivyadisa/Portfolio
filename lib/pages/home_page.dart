import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/sns_links.dart';
import 'package:my_portfolio/widgets/contact_section.dart';
import 'package:my_portfolio/widgets/drawer_mobile.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobile.dart';
import 'package:my_portfolio/widgets/projects_section.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';
import 'dart:js' as js;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarkeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: CustomColor.ScaffoldBg,
          endDrawer: constraints.maxWidth >= kMinDesktopWidth 
          ? null 
          : DrawerMobile(onNavItemTap: (int navIndex) {
              _scaffoldKey.currentState?.closeEndDrawer();
              scrollToSection(navIndex);
            }),
          body: Stack(
            children: [
              SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(key: navbarkeys.first),
                    if (constraints.maxWidth >= kMinDesktopWidth)
                      const SizedBox(height: 50.0) // Placeholder for header height
                    else
                      const SizedBox(height: 50.0), // Placeholder for header height
                    // MAIN
                    if (constraints.maxWidth >= kMinDesktopWidth)
                      const MainDesktop()
                    else
                      const MainMobile(),
                    // SKILLS
                    Container(
                      key: navbarkeys[1],
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                      width: screenWidth,
                      color: CustomColor.bgLight1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //title
                          const Text(
                            "What I can do",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: CustomColor.whitePrimary,
                            ),
                          ),
                          const SizedBox(height: 50),
                          //platforms and Skills
                          if (constraints.maxWidth >= kMedDesktopWidth)
                            const SkillsDesktop()
                          else
                            const SkillsMobile(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    // PROJECTS
                    ProjectsSection(key: navbarkeys[2]),
                    const SizedBox(height: 30.0),
                    // CONTACT
                    ContactSection(key: navbarkeys[3]),
                    // FOOTER
                    const Footer(),
                  ],
                ),
              ),
            
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: constraints.maxWidth >= kMinDesktopWidth
                    ? HeaderDesktop(
                        onNavItemTap: (int navIndex) {
                          scrollToSection(navIndex);
                        },
                      )
                    : HeaderMobile(
                        onMenuTap: () {
                          _scaffoldKey.currentState?.openEndDrawer();
                        },
                        onLogoTap: () {
                          // Handle logo tap if needed
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
   

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      // open a blog page
      js.context.callMethod('open', [SnsLinks.blog]);
      return;
    }
    final key = navbarkeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

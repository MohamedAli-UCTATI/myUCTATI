import 'package:UCTATI/data/data.dart';
import 'package:UCTATI/screen/webview.dart';
import 'package:flutter/material.dart';
import 'package:UCTATI/widget/gridbuiler.dart';
import 'package:UCTATI/model/griditem.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';
import 'package:UCTATI/widget/icon_button_widget.dart';
import 'package:UCTATI/widget/carousel_widget.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:UCTATI/provider/provider.dart';

class Landscape extends ConsumerStatefulWidget {
  const Landscape({super.key});

  @override
  ConsumerState<Landscape> createState() => _Landscape();
}

class _Landscape extends ConsumerState<Landscape> {
  List<GridItem> grid = gridItemsStudent;
  int _selectedIndex = 0;

  void _onItemTapped(integer) {
    setState(() {
      _selectedIndex = integer;
      switch (integer) {
        case 0:
          grid = gridItemsStudent;
          break;
        case 1:
          grid = gridItemsStaff;
          break;
        case 2:
          grid = gridItems;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(darkModeProvider) ??
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final iconColor = isDarkMode ? Colors.white : Colors.black;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final backgroundColor = isDarkMode ? Colors.black : Colors.white;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Row(
          children: [
            NavigationRail(
              elevation: 24,
              backgroundColor: backgroundColor,
              indicatorColor: backgroundColor,
              selectedIndex: _selectedIndex,
              onDestinationSelected: _onItemTapped,
              labelType: NavigationRailLabelType.selected,
              destinations: [
                NavigationRailDestination(
                  padding: const EdgeInsets.only(top: 5),
                  icon: const Icon(
                    Icons.school_outlined,
                    color: Colors.grey,
                  ),
                  selectedIcon: Icon(
                    Icons.school,
                    color: iconColor,
                  ),
                  label: Text('Student',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: textColor)),
                ),
                NavigationRailDestination(
                  icon: const Icon(
                    Icons.work_outline,
                    color: Colors.grey,
                  ),
                  selectedIcon: Icon(
                    Icons.work,
                    color: iconColor,
                  ),
                  label: Text('Staff',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: textColor)),
                ),
                NavigationRailDestination(
                  icon: const Icon(
                    Icons.more_outlined,
                    color: Colors.grey,
                  ),
                  selectedIcon: Icon(
                    Icons.more,
                    color: iconColor,
                  ),
                  label: Text('More',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: textColor)),
                ),
              ],
            ),
            Expanded(
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: backgroundColor,
                  centerTitle: false,
                  title: Row(children: [
                    IconButton(
                      tooltip: "Theme",
                      color: iconColor, // Set the color of the back button
                      onPressed: () async {
                        ref
                            .read(darkModeProvider.notifier)
                            .toggleDarkMode(!isDarkMode);
                      },
                      icon: Icon(isDarkMode
                          ? Icons.wb_sunny_outlined
                          : Icons.nightlight_outlined),
                    ),
                    IconButtonWidget(
                      title: "Privacy policy",
                      url:
                          "https://docs.google.com/document/d/1koTUejBkSzXAfBnWJLprgtVg3t8r3OdRxAHR0MjKUiA",
                      color: iconColor,
                      icon: Icons.privacy_tip_outlined,
                    ),
                  ]),
                  actions: [
                    IconButtonWidget(
                      title: "Facebook",
                      url: "https://www.facebook.com/UCTATIofficial/",
                      color: iconColor,
                      icon: FontAwesome.facebook,
                    ),
                    IconButtonWidget(
                      title: "Instagram",
                      url: "https://www.instagram.com/uctati_official/",
                      color: iconColor,
                      icon: FontAwesome.instagram,
                    ),
                    IconButtonWidget(
                      title: "Twitter",
                      url:
                          "https://twitter.com/i/flow/login?redirect_after_login=%2Fuctati",
                      color: iconColor,
                      icon: FontAwesome.twitter,
                    ),
                    IconButtonWidget(
                      title: "LinkedIn",
                      url:
                          "https://www.linkedin.com/school/university-college-tati-official/",
                      color: iconColor,
                      icon: FontAwesome.linkedin,
                    ),
                  ],
                ),
                backgroundColor: backgroundColor,
                body: ListView(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/students.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Carousel(),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: GridBuilder(
                          item: grid,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                ]),
                floatingActionButton: FloatingActionButton.extended(
                  backgroundColor: backgroundColor,
                  label: Text(
                    'Academic Guidelines',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  onPressed: () {
                    kIsWeb
                        ? launchUrl(
                            Uri.parse(
                                "https://drive.google.com/file/d/10lmjSv3fAvqAu7msDdGvwE5-9MgksxXA/view?pli=1"),
                            webViewConfiguration: const WebViewConfiguration(
                                enableJavaScript: true),
                            mode: LaunchMode.externalNonBrowserApplication)
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WebViewPage(
                                title: "Academic Guidelines",
                                url:
                                    "https://drive.google.com/file/d/10lmjSv3fAvqAu7msDdGvwE5-9MgksxXA/view?pli=1",
                                launchUrl:
                                    "https://drive.google.com/uc?export=download&id=10lmjSv3fAvqAu7msDdGvwE5-9MgksxXA",
                                icon: Icons.download,
                              ),
                            ),
                          );
                  },
                  icon: Icon(
                    Icons.chrome_reader_mode_outlined,
                    color: iconColor,
                  ),
                  elevation: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
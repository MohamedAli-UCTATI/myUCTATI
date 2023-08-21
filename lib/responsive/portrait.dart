import 'package:UCTATI/common/pallete.dart';
import 'package:flutter/material.dart';
import 'package:UCTATI/data/data.dart';
import 'package:UCTATI/screen/webview.dart';
import 'package:UCTATI/model/griditem.dart';
import 'package:UCTATI/provider/provider.dart';
import 'package:UCTATI/widget/widgets.dart';
import 'package:UCTATI/common/constant.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

class Portrait extends ConsumerStatefulWidget {
  const Portrait({super.key});

  @override
  ConsumerState<Portrait> createState() => _PortraitState();
}

class _PortraitState extends ConsumerState<Portrait> {
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
    final pallette = Pallette(isDarkMode);
    final iconColor = pallette.iconColor;
    final textColor = pallette.textColor;
    final backgroundColor = pallette.backgroundColor;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: false,
        title: Row(children: [
          IconButton(
            tooltip: "Theme",
            color: iconColor, // Set the color of the back button
            onPressed: () async {
              ref.read(darkModeProvider.notifier).toggleDarkMode(!isDarkMode);
            },
            icon: Icon(isDarkMode
                ? Icons.wb_sunny_outlined
                : Icons.nightlight_outlined),
          ),
          IconButtonWidget(
            title: "Privacy policy",
            url: Constant.urlPrivacyPolicy,
            color: iconColor,
            icon: Icons.privacy_tip_outlined,
          ),
        ]),
        actions: [
          IconButtonWidget(
            title: "Facebook",
            url: Constant.urlFacebook,
            color: iconColor,
            icon: FontAwesome.facebook,
          ),
          IconButtonWidget(
            title: "Instagram",
            url: Constant.urlInstagram,
            color: iconColor,
            icon: FontAwesome.instagram,
          ),
          IconButtonWidget(
            title: "Twitter",
            url: Constant.urlTwitter,
            color: iconColor,
            icon: FontAwesome.twitter,
          ),
          IconButtonWidget(
            title: "LinkedIn",
            url: Constant.urlLinkedin,
            color: iconColor,
            icon: FontAwesome.linkedin,
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/students.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          GridBuilder(
            item: grid,
          ),
          Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: const Carousel()),
          const SizedBox(
            height: 120,
          ),
        ],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          elevation: 24,
          backgroundColor: backgroundColor,
          surfaceTintColor: backgroundColor,
          indicatorColor: backgroundColor,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child: NavigationBar(
          destinations: [
            NavigationDestination(
              selectedIcon: Icon(
                Icons.school,
                color: iconColor,
              ),
              icon: const Icon(
                Icons.school_outlined,
                color: Colors.grey,
              ),
              label: 'Student',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.work,
                color: iconColor,
              ),
              icon: const Icon(
                Icons.work_outline,
                color: Colors.grey,
              ),
              label: 'Staff',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.more,
                color: iconColor,
              ),
              icon: const Icon(
                Icons.more_outlined,
                color: Colors.grey,
              ),
              label: 'More',
            )
          ],
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: backgroundColor,
        label: Text(
          'Academic Guidelines',
          style: TextStyle(
            color: textColor,
          ),
        ),
        onPressed: () {
          (kIsWeb || Platform.isMacOS || Platform.isWindows)
              ? launchUrl(Uri.parse(Constant.urlAcademic),
                  webViewConfiguration:
                      const WebViewConfiguration(enableJavaScript: true),
                  mode: LaunchMode.externalNonBrowserApplication)
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebViewPage(
                      title: "Academic Guidelines",
                      url: Constant.urlAcademic,
                      launchUrl: Constant.urlAcademicLaunch,
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
    );
  }
}

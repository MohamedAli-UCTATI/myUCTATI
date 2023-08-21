import 'package:flutter/material.dart';
import 'package:UCTATI/screen/webview.dart';
import 'package:UCTATI/model/griditem.dart';
import 'package:UCTATI/provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

import '../common/pallete.dart';

class GridBuilder extends ConsumerWidget {
  const GridBuilder({
    super.key,
    required this.item,
  });

  final List<GridItem> item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider) ??
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.width;
    final isLargeScreen = widthSize > 600;
    final pallette = Pallette(isDarkMode);
    final iconColor = pallette.iconColor;
    final textColor = pallette.textColor;
    final cardColor = pallette.cardColor;
    final carkSurfaceTintColor = pallette.cardSurfaceTintColor;

    return Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 16,
        spacing: 16,
        children: [
          for (var item in item)
            InkWell(
              borderRadius: BorderRadius.circular(25.0),
              onTap: () {
                (kIsWeb || Platform.isMacOS || Platform.isWindows)
                    ? launchUrl(Uri.parse(item.url),
                        webViewConfiguration:
                            const WebViewConfiguration(enableJavaScript: true),
                        mode: LaunchMode.externalNonBrowserApplication)
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewPage(
                            title: item.title,
                            url: item.url,
                            icon: item.icon,
                          ),
                        ),
                      );
              },
              child: SizedBox(
                width: !isLargeScreen ? widthSize / 3 : heightSize / 6,
                height: !isLargeScreen ? widthSize / 3 : heightSize / 6,
                child: Card(
                  surfaceTintColor: carkSurfaceTintColor,
                  color: cardColor,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item.icon,
                        size: !isLargeScreen ? widthSize / 16 : heightSize / 32,
                        color: iconColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          item.title, // Pass the title as the child of the Text widget
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: !isLargeScreen
                                ? widthSize / 40
                                : heightSize / 80,
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        ]);
  }
}

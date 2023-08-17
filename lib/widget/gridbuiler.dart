import 'package:flutter/material.dart';
import 'package:UCTATI/screen/webview.dart';
import 'package:UCTATI/model/griditem.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:UCTATI/provider/provider.dart';

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

    return Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 16,
        spacing: 16,
        children: [
          for (var item in item)
            InkWell(
              borderRadius: BorderRadius.circular(25.0),
              onTap: () {
                kIsWeb
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
                  surfaceTintColor: isDarkMode
                      ? const Color.fromARGB(255, 50, 50, 50)
                      : Colors.white,
                  color: isDarkMode ? Colors.white10 : Colors.white,
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
                        color: isDarkMode ? Colors.white : Colors.black,
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
                            color: isDarkMode ? Colors.white : Colors.black,
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

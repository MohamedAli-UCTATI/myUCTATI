import 'package:flutter/material.dart';
import 'package:UCTATI/screen/webview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget(
      {super.key,
      required this.color,
      required this.icon,
      required this.title,
      required this.url});
  final Color color;
  final IconData icon;
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: title,
      color: color,
      icon: Icon(icon),
      onPressed: () {
        (kIsWeb || Platform.isMacOS || Platform.isWindows)
            ? launchUrl(Uri.parse(url),
                webViewConfiguration:
                    const WebViewConfiguration(enableJavaScript: true),
                mode: LaunchMode.externalNonBrowserApplication)
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewPage(
                    title: title,
                    url: url,
                    launchUrl: url,
                    icon: icon,
                  ),
                ),
              );
      },
    );
  }
}

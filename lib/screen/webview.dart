import 'package:flutter/material.dart';
import 'package:UCTATI/provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewPage extends ConsumerStatefulWidget {
  final String title;
  final String url;
  final String? launchUrl;
  final IconData? icon;

  const WebViewPage(
      {super.key,
      required this.title,
      required this.url,
      this.launchUrl,
      this.icon = Icons.open_in_browser});

  @override
  WebViewPageState createState() => WebViewPageState();
}

class WebViewPageState extends ConsumerState<WebViewPage> {
  bool _isLoading = true;
  bool _hasError = false;
  late WebViewController _webViewController;

  @override
  void initState() {
    _webViewController = WebViewController()
      ..loadRequest(Uri.parse(widget.url))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              _hasError = true;
            });
            launchUrl(Uri.parse(widget.launchUrl ?? widget.url),
                webViewConfiguration:
                    const WebViewConfiguration(enableJavaScript: true),
                mode: LaunchMode.externalNonBrowserApplication);
          },
        ),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(darkModeProvider) ??
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final iconColor = isDarkMode ? Colors.white : Colors.black;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final backgroundColor = isDarkMode ? Colors.black : Colors.white;

    void launch() {
      launchUrl(Uri.parse(widget.launchUrl ?? widget.url),
          webViewConfiguration:
              const WebViewConfiguration(enableJavaScript: true),
          mode: LaunchMode.externalNonBrowserApplication);
    }

    Future<void> reloadWebView() async {
      setState(() {
        _hasError = false;
      });

      await _webViewController.reload();
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: textColor,
          ),
        ),
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: iconColor, // Set the color of the back button
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: reloadWebView,
            icon: const Icon(Icons.refresh),
            color: iconColor,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: widget.launchUrl != null ? 90 : 0),
        child: Stack(
          children: [
            Visibility(
              visible: !_hasError,
              child: WebViewWidget(
                controller: _webViewController,
              ),
            ),
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            if (_hasError)
              Center(
                child: TextButton.icon(
                  icon: Icon(widget.icon, color: iconColor),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          16.0), // Adjust the value for corner radius
                    ),
                    side: BorderSide(
                      width: 2.0, // Set the border width
                      color: iconColor, // Set the border color
                    ),
                    backgroundColor:
                        backgroundColor, // Customize background color here
                    minimumSize: const Size(200, 60),
                    // You can add other button styles here if needed
                  ),
                  onPressed: () {
                    launch();
                  },
                  label: Text(
                    widget.title,
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: (widget.launchUrl != null)
          ? FloatingActionButton.extended(
              backgroundColor: backgroundColor,
              icon: Icon(widget.icon, color: iconColor),
              elevation: 24,
              label: Text(
                widget.title == "Academic Guidelines"
                    ? 'Download'
                    : "Open in ${widget.title}",
                style: TextStyle(
                  color: textColor,
                ),
              ),
              onPressed: () {
                launch();
              },
            )
          : null, // Hide the button if _showDownloadButton is false
    );
  }
}

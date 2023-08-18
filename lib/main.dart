import 'package:flutter/material.dart';
import 'package:UCTATI/responsive/orientation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const ProviderScope(child: MyMainApp()));
}

class MyMainApp extends StatelessWidget {
  const MyMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    return MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
      ),
      home: isLargeScreen ? const Landscape() : const Portrait(),
    );
  }
}

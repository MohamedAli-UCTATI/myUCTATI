import 'package:UCTATI/responsive/landscape.dart';
import 'package:flutter/material.dart';
import 'package:UCTATI/responsive/portrait.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
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

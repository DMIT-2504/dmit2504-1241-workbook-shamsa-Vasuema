import 'package:flutter/material.dart';
import 'package:week05_navigation_with_custom_input/page_one.dart';
import 'package:week05_navigation_with_custom_input/page_two.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/pageTwo': (context) => const PageTwo()},
      initialRoute: '/',
      home: PageOne(),
    );
  }
}

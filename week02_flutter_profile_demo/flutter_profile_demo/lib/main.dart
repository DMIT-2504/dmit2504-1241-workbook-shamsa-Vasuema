import 'package:flutter/material.dart';
import 'package:flutter_profile_demo/homepage.dart';
import 'package:flutter_profile_demo/widgets/profile_detail.dart';
import 'package:flutter_profile_demo/widgets/profile_image.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            //themedata is necessary to set up any themes
            scaffoldBackgroundColor: Colors.blue,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue, brightness: Brightness.dark),
            //this will create a base color scheme you can access elsewhere too
            textTheme: const TextTheme(
                bodyLarge: TextStyle(
                    color: Color.fromARGB(255, 231, 6, 69), fontSize: 18))),
        home: const MyHomePage());
  }
}

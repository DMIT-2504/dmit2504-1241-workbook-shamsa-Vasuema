import 'package:flutter/material.dart';

ThemeData customTheme(){
  return ThemeData(
            //themedata is necessary to set up any themes
            scaffoldBackgroundColor: Colors.blue,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue, brightness: Brightness.dark),
            //this will create a base color scheme you can access elsewhere too
            textTheme: const TextTheme(
                bodyLarge: TextStyle(
                    color: Color.fromARGB(255, 231, 6, 69), fontSize: 18)));
}
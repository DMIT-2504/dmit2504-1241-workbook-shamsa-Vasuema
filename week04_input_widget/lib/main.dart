import 'package:flutter/material.dart';
// import 'package:week04_input_widget/simple_text_field.dart';
import 'package:week04_input_widget/textfield_with_controller.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: 
        //SimpleTextInput()
        TextFieldWithController(),
      ),
    );
  }
}

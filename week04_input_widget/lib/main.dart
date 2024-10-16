import 'package:flutter/material.dart';
// import 'package:week04_input_widget/simple_text_field.dart';
//import 'package:week04_input_widget/textfield_with_controller_stateless.dart';
//import 'package:week04_input_widget/textfield_with_stateful.dart';
import 'package:week04_input_widget/textformfield_stateful.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:Scaffold(
        body: 
        //SimpleTextInput()
        //TextFieldWithController(),
        //SimpleTextFieldState()
        TextFormFieldStateful()
      ),
    );
  }
}

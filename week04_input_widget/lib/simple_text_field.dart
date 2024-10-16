import 'package:flutter/material.dart';

class SimpleTextInput extends StatelessWidget {
  const SimpleTextInput({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.all(16),
    child: TextField(
      decoration: InputDecoration(
        labelText: 'Enter Text Here'
      ),
    ),
    );
  }
}
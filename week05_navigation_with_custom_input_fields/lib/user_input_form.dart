import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const NameField({this.label = 'Name', required this.controller, super.key});
  //optional label if nothing is passed in aka default value of 'name'

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            fillColor: Colors.blue[300],
            labelText: label,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a $label';
          }
          return null;
        },
      ),
    );
  }
}


class WhatYouDoField extends StatefulWidget{
  final TextEditingController controller;
  final String label;

  WhatYouDoField ({super.key, required this.controller, this.label = 'What you do'})
  @override
  WhatYouDoFieldState createState(){
    return WhatYouDoFieldState();
  }
}

class WhatYouDoFieldState extends State<WhatYouDoField>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
            fillColor: Colors.blue[300],
            labelText: widget.label,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a $widget.label';
          }
          return null;
        },
      ),
    );
}
}

class EmailFormField extends FormField<String>{
  final TextEditingController controller;
  final String label;

  EmailFormField({super.key, required this.controller, this.label = 'Email', required super.builder})

  :super(
    initialValue: controller.text,
    validator: (value){
      if(value == null || value.isEmpty){
        return 'Email is required';
      }
      if(RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
        return 'Enter a valid email';
      }
      return null;
    },
    builder: (FormFieldState<String> field){
      final EmailFormFieldState state = field as EmailFormFieldState;
      state._setController(controller);
    }
  )
}


class EmailFormFieldState extends FormFieldState<String>{
  TextEditingController? _controller;

  void _setController(TextEditingController controller){
    if(_controller != controller){
      if(_controller != null){
        _controller!.removeListener(_onControllerChanged);
      }
      _controller = controller;
      _controller!.addListener(_onControllerChanged);
    }
  }

  void _onControllerChanged(){
    didChange(_controller!.text);
  }

  @override
  void dispose(){
    if(_controller != null){
      _controller!.removeListener(_onControllerChanged);
    }
    super.dispose();
  }
  }




}
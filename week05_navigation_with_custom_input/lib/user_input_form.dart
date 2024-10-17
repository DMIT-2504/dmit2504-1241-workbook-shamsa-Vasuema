import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const NameField(
      {super.key, required this.controller, this.label = 'Vanessa'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              fillColor: Colors.white,
              labelText: label,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a $label';
            }
            return null;
          }),
    );
  }
}

class WhatYouDoField extends StatefulWidget {
  final TextEditingController controller;
  final String label;

  const WhatYouDoField(
      {super.key, required this.controller, this.label = 'What you do'});

  @override
  State<WhatYouDoField> createState() => _WhatYouDoFieldState();
}

class _WhatYouDoFieldState extends State<WhatYouDoField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
              fillColor: Colors.white,
              labelText: widget.label,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a ${widget.label}';
            }
            return null;
          }),
    );
  }
}

class EmailFormField extends FormField<String> {
  final TextEditingController controller;
  final String label;

  EmailFormField({super.key, required this.controller, this.label = 'Email'})
      : super(
            initialValue: controller.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              if (RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Enter a valid email';
              }
              return null;
            },
            builder: (FormFieldState<String> field) {
              final EmailFormFieldState state = field as EmailFormFieldState;
              state._setController(controller);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText: label,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a $label';
                      }
                      return null;
                    }),
              );
            });

  @override
  //create state
  FormFieldState<String> createState() => EmailFormFieldState();
}

class EmailFormFieldState extends FormFieldState<String> {
  TextEditingController? _controller;

  //functions to update the controller
  void _setController(TextEditingController controller) {
    if (_controller != controller) {
      if (_controller != null) {
        _controller!.removeListener(_onControllerChanged);
      }
      _controller = controller;
      _controller!.addListener(_onControllerChanged);
    }
  }

  void _onControllerChanged() {
    didChange(_controller!.text);
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.removeListener(_onControllerChanged);
    }
    super.dispose();
  }
}

class UserInputForm extends StatefulWidget {
  final Widget submitButton;
  final GlobalKey<FormState> formKey;
  TextEditingController nameController;
  TextEditingController whatYouDoController;
  TextEditingController emailController;

  UserInputForm(
      {required this.submitButton,
      required this.emailController,
      required this.nameController,
      required this.whatYouDoController,
      required this.formKey,
      super.key});

  @override
  State<UserInputForm> createState() => _UserInputFormState();
}

class _UserInputFormState extends State<UserInputForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Column(
          children: [
            NameField(controller: widget.nameController),
            WhatYouDoField(controller: widget.whatYouDoController),
            EmailFormField(controller: widget.emailController),
            const SizedBox(height: 20),
            widget.submitButton
          ],
        ));
  }
}

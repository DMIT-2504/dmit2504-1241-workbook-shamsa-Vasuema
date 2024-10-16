import 'package:flutter/material.dart';

class SimpleTextFieldState extends StatefulWidget {
  const SimpleTextFieldState({super.key});

  @override
  State<SimpleTextFieldState> createState() => _SimpleTextFieldStateState();
}

class _SimpleTextFieldStateState extends State<SimpleTextFieldState> {
  // controller instantiating
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String? nameError;
  String? emailError;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //name text
          const SizedBox(height: 50),

          TextField(
            controller: nameController,
            decoration: InputDecoration(
                labelText: 'Enter name',
                errorText: nameError //display error message for name
                ),
            onChanged: (text) {
              setState(() {
                if (text.isEmpty) {
                  nameError = 'Name cannot be empty';
                } else {
                  nameError = null;
                }
              });
            },
          ),
          const SizedBox(height: 50),
          //email input
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Enter email',
              errorText: nameError, //display error message for name
            ),
            onChanged: (text) {
              setState(() {
                if (text.isEmpty) {
                  nameError = 'Email cannot be empty';
                } else {
                  nameError = null;
                }
              });
            },
          ),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () {
                String userName = nameController.text;
                String email = emailController.text;

                setState(() {
                  if (userName.isEmpty) {
                    nameError = 'Name cannot be empty';
                  } else {
                    nameError = null;
                  }
                  if (email.isEmpty) {
                    emailError = 'Name cannot be empty';
                  } else {
                    emailError = null;
                  }
                  if (nameError == null && emailError == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      'Your name is: $userName and your email is: $email',
                      style: const TextStyle(fontSize: 26),
                    )));
                  }
                });
              },
              child: const Text(
                'Submit',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ))
        ],
      ),
    );
  }
}

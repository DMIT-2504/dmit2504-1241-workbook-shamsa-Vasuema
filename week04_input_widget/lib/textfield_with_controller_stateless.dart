import 'package:flutter/material.dart';

class TextFieldWithController extends StatelessWidget {
  // controller instantiating
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  TextFieldWithController({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
                labelText: 'Enter Name Here',
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
                labelText: 'Enter Emeil Here',
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                String userName = nameController.text;
                String email = emailController.text;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                  'Your name is: $userName and your email is: $email',
                  style: const TextStyle(fontSize: 26),
                )));
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

import 'package:flutter/material.dart';

class TextFormFieldStateful extends StatefulWidget {
  const TextFormFieldStateful({super.key});

  @override
  State<TextFormFieldStateful> createState() => _TextFormFieldStatefulState();
}

class _TextFormFieldStatefulState extends State<TextFormFieldStateful> {
  //key to manage the state of form field
  final _key = GlobalKey<FormState>();
//focus notes for managing focus between fields
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();

  // controller instantiating
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String? nameError;
  String? emailError;

  @override
  void dispose() {
    //dispose controllers and focusnodes to prevent memory leaks
    nameController.dispose();
    emailController.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _key, //pass in key to manager state
            autovalidateMode: AutovalidateMode
                .onUserInteraction, //this validates autmatically on user interaction
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: nameController,
                  focusNode: nameFocusNode,
                  decoration: const InputDecoration(
                      labelText: 'Enter name',
                      errorStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 20) //display error message for name
                      ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name cannot be empty';
                    }
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  focusNode: emailFocusNode,
                  decoration: const InputDecoration(
                      labelText: 'Enter email',
                      errorStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 20) //display error message for name
                      ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                    onPressed: () {
                      String userName = nameController.text;
                      String email = emailController.text;
                      if (_key.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          'Your name is: $userName and your email is: $email',
                          style: const TextStyle(fontSize: 26),
                        )));
                      }
                    },
                    child: const Text(
                      'Submit',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                    )),
                const SizedBox(height: 50),
                TextButton(
                    onPressed: () {
                      _key.currentState!.reset();
                      nameController.clear();
                      emailController.clear();
                    },
                    child: const Text('Reset Form'))
              ],
            )));
  }
}

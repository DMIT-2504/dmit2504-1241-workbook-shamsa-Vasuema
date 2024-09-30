import 'package:flutter/material.dart';

//this custom widget can be passed in anywhere as a child (unless it needs something else)
class ProfileDetail extends StatelessWidget {
  //the widget class will have to inheret the properties of the parent stateless widget class
  //for this the class needs to EXTENDS into the parent widget

  //properties
  //using final, because it is a stateless widget which cannot be changed/ data will not be changed
  final String label;
  final String value;

  //constructor
  const ProfileDetail(this.label, this.value, {super.key});
  //super.key does help flutter organizing it's widget renders
  //it refers to the key for organizing
  //may cause rendering issues if the key is missing
  //no need to worry about what the key is, just pass it in and flutter will do the rest

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        //is <Widget> before the array necessary? or is it the same?
        Text(
          '$label ', //the $ will turn a string into interpolate string
          style: const TextStyle(
              //const vs no const
              //https://dart.dev/tools/diagnostic-messages?utm_source=dartdev&utm_medium=redir&utm_id=diagcode&utm_content=prefer_const_constructors#prefer_const_constructors
              //has to do with performance in dart
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

import 'dart:io';

import 'package:week01_dart_app_demo/person.dart';
import 'package:week01_dart_app_demo/prompt.dart';
import 'package:week01_dart_app_demo/week01_dart_app_demo.dart'
    as week01_dart_app_demo;

void main(List<String> arguments) {
  print('Hello world: ${week01_dart_app_demo.calculate()}!');
  String name = prompt('Enter your name:');
  int age = promptAge('Enter your age:');

  Person person = Person(name, age);
  stdout.writeln('Your name is: ${person.name} and you are ${person.age} years old.');
}

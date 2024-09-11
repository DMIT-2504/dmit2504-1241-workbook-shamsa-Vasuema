import 'dart:io';

// import 'package:week01_new_dart_project_demo/week01_new_dart_project_demo.dart'
//     as week01_new_dart_project_demo;
import 'package:week01_new_dart_project_demo/person.dart';
import 'package:week01_new_dart_project_demo/week01_new_dart_project_demo.dart';

void main(List<String> arguments) {
  //#region Default
  //print('Hello world: ${week01_new_dart_project_demo.calculate()}!');
  //#endRegion

//#region Simple output
  // stdout
  //     .write('Will write the text and leaves the cursor on the same line ---');
  // stdout.writeln('will write text and move the cursor to the next line');
//#endregion

//#region Simple input and interpolated string
  //stdin.readLineSync(); //will read in the next line as a string
  // stdout.write('Please enter your name: ');
  // String? name = stdin.readLineSync();
  // stdout.writeln('Hello $name, how are you?');
//#endregion

//#region Prompt using methods
  String name1 = prompt(
      'Enter your name: '); //when first using new functions it will complain, hover over it and click "quick fix" and find the import
  int age = promptAge('Enter your age:');
  stdout.writeln('Hello $name1, you are $age old.');
//#endregion

//#region Using the Person class
  Person person = Person(name1,
      age); //creating a person and using the above user input variables (name, age) as the properties
  stdout.writeln(
      'Your name is ${person.name} and you are ${person.age} years old.'); //to use the person object in an interpolated string, you need to use ${} to break out and . (dot) to access the individual properties of the person object
}

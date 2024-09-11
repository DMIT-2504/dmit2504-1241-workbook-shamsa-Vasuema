// int calculate() {
//   return 6 * 7;
// }

import 'dart:ffi';
import 'dart:io';

String prompt(String message) {
  stdout.write(message);
  return stdin
      .readLineSync()!; //using the ! at the end will ensure that the input will not be null.
}

//#region prompt user to enter a number
int promptAge(String message) {
  while (true) {
    //the while loop will ensure to continue prompting the user for input until it can return a value
    try {
      //to protect the program from crashing, we wrap it up in a try and catch
      var userInput = prompt(message); //prompts the user to enter a number
      var parsedInput = int.parse(
          userInput); //a string is supplied and must be parsed to an int
      if (parsedInput <= 0) {
        throw Exception('please provide a positive number.');
      }
      if (parsedInput < 18) {
        throw Exception('you are not old enoguh for this site');
      }
      if (parsedInput > 99) {
        throw Exception('you exceeded the maximum age allowed here.');
      }
      return parsedInput;
    } catch (e) {
      stdout.writeln(
          'Invalid input, $e'); //you need to use interpolated strings to add the message you wrote in your conditions' exception
    }
  }
}

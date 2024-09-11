import 'dart:io';

String prompt(String message){
  stdout.write(message);
  return stdin.readLineSync()!;
}

int promptAge(String message){
  //TODO add input validation
  bool isValid = false;
  while(!isValid){
    try{
    var userInput = prompt((message));
    return int.parse(userInput);
    }
    catch(e){
      stdout.writeln('invalid number');
    }
  }
}
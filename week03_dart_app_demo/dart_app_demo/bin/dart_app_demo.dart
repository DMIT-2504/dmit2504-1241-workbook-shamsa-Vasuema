import 'dart:convert';

import 'package:dart_app_demo/dart_app_demo.dart' as dart_app_demo;
import 'package:http/http.dart' as http;

void main(List<String> arguments) {
  print('Hello world: ${dart_app_demo.calculate()}!');
  //getDogData();
  getDogBreeds();
}

void getDogData() async {
  var dogData = await getJson('https://dog.ceo/api/breeds/image/random');
}

//future is what dart uses for async programming
//future expects a <Type>
//it will be async and wait for the data to return
//even if it is sync, it will read it as async
//add http dependency with "dart pub add http" in the terminal
Future<dynamic> getJson(String apiEndpoint) async {
  var url = Uri.parse(apiEndpoint);
  var response = await http.get(url);
  //print(response);
  var decodedJson = jsonDecode(response.body);
  //print(decodedJson);
  return decodedJson;
}
//when running the debugger, you create a new json file and add a new line with "program": "bin/dart_app_demo.dart"
//this is the path to this file so a response can be recorded

void getDogBreeds() async {
  var dogBreeds = await getJson('https://dog.ceo/api/breeds/list/all');
  //after you got the completed response you can use it
  //if only a specific type of information is needed, you can select them in the following manner:
  print(dogBreeds['message']['terrier'][1]);
  //you have to know how the returned json data looks like to be able to pick out the right key (message) and element (terrier), if you want to select the next or 3rd terrier from the terrier array, you need to know the index - really, anytime you need a specific array/element you need the index
}

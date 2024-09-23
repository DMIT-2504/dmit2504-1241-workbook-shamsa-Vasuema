import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

void main(List<String> arguments) {
  stdout.writeln('Please enter a word:');
  var userInput = stdin.readLineSync();
  //print(userInput);
  getWordMeaning(userInput);
}

///async function that returns decoded json data from an api
Future<dynamic> getJson(api) async {
  var url = Uri.parse(api);
  var response = await http.get(url);
  var decodedJson = jsonDecode(response.body);
  return decodedJson;
}

///async function that gets the json from an api endpoint
void getWordMeaning(userInput) async {
  try {
    var apiData = await getJson(
        'https://api.dictionaryapi.dev/api/v2/entries/en/$userInput');

    if (apiData == null) {
      print('Please enter a word that exists');
    }
    var listItems = apiData[0]['meanings'];
    //above and below variable may be combined as needed
    var desiredElement = listItems[0]['definitions'][0]['definition'];
    print(desiredElement);
  } catch (e) {
    print('Error occurred: $e');
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Network Image',
      home: ImageScreen()
    );
  }
}

//stateful widget to track state of network image
class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

//this instantiates the state object
  @override
  _ImageState createState(){
    return _ImageState();
  } 

}

//state class
class _ImageState extends State<ImageScreen> {
  String? _imageURL;

  //call the api endpoint
  //callback function to get the image
  Future<void> _fetchImage() async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      //rebuild UI once image is received
      setState(() {
        _imageURL = data['message'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 500,
                width: double
                    .infinity, //this will take up the entire width of the screen; cannot be applied to the height
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: _imageURL == null
                    ? const Center(child: Text('Please try again'))
                    : Image.network(
                        _imageURL!, // needs null assertion (cannot be null)
                        fit: BoxFit.contain //contain prevents cropping
                        ,
                      )),
            //space between image and button
            const SizedBox(
              //this sizebox is the gap
              height: 20,
            ),
            //button to load the image and trigger UI build
            ElevatedButton(
                onPressed: _fetchImage, child: const Text('Load Image'))
          ],
        ),
      ),
    );
  }
}

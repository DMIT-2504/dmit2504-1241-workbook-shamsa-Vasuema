import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profile page demo'),
        ),
        body: Column(
            //column means it places the following CHILDREN underneath each other
            children: [
              //children widgets are an array of containers
              //header
              const Padding(
                  //general padding styling that applies to a specific child inside
                  padding: EdgeInsets.all(16),
                  child: Text('Employee Profile',
                      style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold))),
              //profile image
              Container(
                //circular container/box for profile picture
                width: 250.0,
                height: 250.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    //to add an image the following pieces are necessary
                    // plus an asset addition in the pubspec.yaml file WITHIN FLUTTER --> pubspec file
                    image: DecorationImage(
                        image: AssetImage('images/harmony.jpg'),
                        fit: BoxFit.cover)),
              ),
              // profile name
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Harmony',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Position:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' Developer',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}

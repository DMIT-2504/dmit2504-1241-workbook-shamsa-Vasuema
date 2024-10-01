import 'package:flutter/material.dart';
import 'package:flutter_profile_demo/widgets/profile_detail.dart';
import 'package:flutter_profile_demo/widgets/profile_image.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      //here you can access the colorscheme you determined on the main
      //if no color is selected from the theme and context, it will automatically default to the scaffoldBackgroundColor
      body: const Column(
          //column means it places the following CHILDREN underneath each other
          children: [
            //children widgets are an array of containers
            //header
            Padding(
                //general padding styling that applies to a specific child inside
                padding: EdgeInsets.all(16),
                child: Text('Employee Profile',
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold))),

            //profile image

            // Container(
            //   //circular container/box for profile picture
            //   width: 250.0,
            //   height: 250.0,
            //   decoration: const BoxDecoration(
            //       shape: BoxShape.circle,
            //       //to add an image the following pieces are necessary
            //       // plus an asset addition in the pubspec.yaml file WITHIN FLUTTER --> pubspec file
            //       image: DecorationImage(
            //           image: AssetImage('images/harmony.jpg'),
            //           fit: BoxFit.cover)),
            // ),

            //above container was replaced with this custom widget
            ProfileImage('images/harmony.jpg'),

            // profile name
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Harmony',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //   const Padding(
            //     padding: EdgeInsets.only(left: 16),
            //     child: Row(
            //       //have the widgets lined up, left to right instead of top to bottom in column
            //       children: <Widget>[
            //         // //an array of widgets
            //         // Text(
            //         //   'Position:',
            //         //   style:
            //         //       TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //         // ),
            //         // Text(
            //         //   ' Developer',
            //         //   style: TextStyle(fontSize: 20),
            //         // )

            //       ],
            //     ),
            //   )

            //above code was replaced with a custom widget (ProfileDetail)
            Row(
                //to manipulate the padding you can add a mainAxisAlignment
                mainAxisAlignment: MainAxisAlignment
                    .center, //this centeres the text of the profileDetail widget
                children: [ProfileDetail('Position: ', 'Food Tester')])
          ]),
    );
  }
}

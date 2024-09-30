import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget{
  final String imagePath;
  
  const ProfileImage(this.imagePath, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
                //circular container/box for profile picture
                width: 250.0,
                height: 250.0,
                decoration: BoxDecoration( //no const here! complains
                    shape: BoxShape.circle,
                    //to add an image the following pieces are necessary
                    // plus an asset addition in the pubspec.yaml file WITHIN FLUTTER --> pubspec file
                    image: DecorationImage(
                        image: AssetImage(imagePath), //use the variable instead of hard code
                        fit: BoxFit.cover)),
              );
  }

  
}
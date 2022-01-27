
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:crop_image/crop_image.dart';
import './text_recognizer.dart';

class MyCrop extends StatelessWidget {

  File file;
  MyCrop({ Key? key ,required this.file}) : super(key: key);


  final controller = CropController(

    aspectRatio: 6,
    defaultCrop: Rect.fromLTRB(0.05, 0.4, 0.95, 0.6),
  );

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1),() async{
      Image image = await   controller.croppedImage();
      String text = await  TextRecognizer.textFromImage(image);
      Navigator.of(context).pop([text]);


    });

    return Container(

      child: Scaffold(
        appBar: AppBar( ),
        body: Stack(
          children: [
            Center(child: CircularProgressIndicator(),),
            Visibility(
              visible: false,
              maintainState: true,
              child: CropImage(
                controller: controller,
                image: Image.file(file),

              ),
            ),
          ],
        ),
      ),

    );
  }
}
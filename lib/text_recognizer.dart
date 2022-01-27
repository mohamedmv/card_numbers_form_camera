

import 'dart:io';
import 'dart:typed_data';

import 'package:learning_input_image/learning_input_image.dart';

import 'package:flutter/material.dart';

import 'package:learning_text_recognition/learning_text_recognition.dart';
import 'camera.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';

import 'corp.dart';
class TextRecognizer{

  Future<String> start(BuildContext context) async{
    var r = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExampleCameraOverlay()));
    if(r == [] || r[0]== null) return '';
    XFile file = r[0];
    r= await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyCrop(file: File(file.path),    )));
    if(r == [] || r[0]== null) return '';
    return r[0];


  }



  static Future<String> textFromImage(Image image) async{
    var result;
    String text ='';

    try{
      TextRecognition recognizer = TextRecognition();
      ScreenshotController controller =ScreenshotController();
      Uint8List f= await controller.captureFromWidget(SizedBox(width:200,height: 40,child:image));





      Directory tempDir = await getTemporaryDirectory();
      File temp = await  File('${tempDir.path}/image.jpg').create();
      temp.writeAsBytesSync(f);



      InputImage inputImage  = InputImage.fromFile(temp);



      result =  await   recognizer.process( inputImage );
      temp.delete();

      if( result != null){



        text = _getNumbers(result.text) ;
      }



    }catch(e){
      print("+++++++++++++++++++++++++++++++++++++++++++++++++");
      print(e);

    }
    return text;

  }
  static String _clean(String s){
    String newelement = '';

    List<String> temp = s.split(' ');
    s= '';
    temp.forEach((element) {s += element;});
    temp = s.split('.');
    s= '';
    temp.forEach((element) {s += element;});




    return  s;

  }

  static String _getNumbers(String t){
    t = _clean(t);
    List<String> list = t.split('\n');

    String result = '';

    for(String line in list){
      bool b = false;
      for(int i = 0; i < line.length-14 ; i++){

        try{
          int.parse(line.substring(i,i+15));
          result =  line.substring(i,i+15);
          b = true;
          break;
        }
        catch(e){}
      }
      if(b) break;
    }





    if(t.length > 15){

    }
    return result;
  }

}
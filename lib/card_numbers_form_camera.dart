library card_numbers_form_camera;

import 'package:card_numbers_form_camera/text_recognizer.dart';
import 'package:flutter/material.dart';

Future<String> getCardNumbers(BuildContext context) async{
  String  s = await TextRecognizer().start(context);
  return s;
}

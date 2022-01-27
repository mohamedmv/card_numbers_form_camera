<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

in pubspec.yaml file make sure to add the folowing under dependencies:
  card_numbers_form_camera:
      git:
        url: https://github.com/mohamedmv/card_numbers_form_camera.git
        ref: master

## Usage



```dart
// first import the packge
import 'package:card_numbers_form_camera/card_numbers_form_camera.dart';
```
```dart
//to call the getCardNumbers method you need a BuildContext so make sure to be inside of a widget
// the method return a future String so make sure to await it
String card_numbers = await getCardNumbers(context);
```

```dart
// the perfect way is to call if inside an async function
//Example
TextButton(
    child: Text('scan numbers'),
    onPressed: ()async {
             String s = await  getCardNumbers(context);
             setState(() {
               text= s;
             });

            },),
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.

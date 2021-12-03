import 'package:flutter/material.dart';
import 'package:image_picker/imagepicker.dart';

main() {
  runApp(imagePicker());
}
class imagePicker extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: imagepicker(),
    );
  }
}

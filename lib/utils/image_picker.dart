import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

imagepicker(ImageSource source) async {
  final ImagePicker _imagepicker = ImagePicker();

  XFile? _xfile = await _imagepicker.pickImage(source: source);

  if (_xfile != null) {
    return _xfile.readAsBytes();
  }
  print('No image is selected');
}

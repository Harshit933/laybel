import 'dart:typed_data';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/image_picker.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  Uint8List? _file;
  bool hasImage = false;

  _selectImage(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Create a post'),
          children: [
            SimpleDialogOption(
              padding: EdgeInsets.all(25),
              child: Text('Take a photo'),
              onPressed: () async {
                Navigator.pop(context);
                _file = await imagepicker(ImageSource.camera);
                setState(() {
                  hasImage = true;
                });
              },
            ),
            SimpleDialogOption(
              padding: EdgeInsets.all(25),
              child: Text('Select a photo from gallery'),
              onPressed: () async {
                Navigator.pop(context);
                Uint8List file = imagepicker(ImageSource.gallery);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              padding: EdgeInsets.all(25),
              child: Text('Cancel'),
              onPressed: () async {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return hasImage == false
        ? GestureDetector(
            onTap: () async {
              _selectImage(context);
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: ShapeDecoration(
                color: Color(0xffe0e0e0),
                image: DecorationImage(
                  image: AssetImage('Icons/Component 1.png'),
                  fit: BoxFit.scaleDown,
                ),
                shape: SmoothRectangleBorder(
                  borderRadius:
                      SmoothBorderRadius(cornerRadius: 8, cornerSmoothing: 0.6),
                ),
              ),
            ),
          )
        : Container(
            width: 100,
            height: 100,
            decoration: ShapeDecoration(
              color: Color(0xffe0e0e0),
              image: DecorationImage(
                image: MemoryImage(_file!),
                fit: BoxFit.fill,
              ),
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 8,
                  cornerSmoothing: 0.6,
                ),
              ),
            ),
          );
  }
}

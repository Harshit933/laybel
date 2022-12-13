import 'dart:typed_data';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/image_picker.dart';
import '../resources/add_post_helper.dart';

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

  // AddpostHelper help = AddpostHelper();

  final List<Uint8List?> imagelist = [];

  List<Uint8List?> getList() {
    return imagelist;
  }

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
                AddpostHelper.set(_file!);
                setState(() {
                  if (_file != null) {
                    hasImage = true;
                  }
                });
              },
            ),
            SimpleDialogOption(
              padding: EdgeInsets.all(25),
              child: Text('Select a photo from gallery'),
              onPressed: () async {
                Navigator.pop(context);
                _file = await imagepicker(ImageSource.gallery);
                AddpostHelper.set(_file!);
                setState(
                  () {
                    hasImage = true;
                  },
                );
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

  _removeImage(BuildContext context) async {
    return showDialog(
      anchorPoint: Offset(12, 12),
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Delete photo'),
          children: [
            SimpleDialogOption(
              padding: EdgeInsets.all(25),
              child: Text('Retake Photo'),
              onPressed: () async {
                setState(() {
                  hasImage = false;
                });
                AddpostHelper.deleteImage(_file!);
                Navigator.pop(context);
                _file = await imagepicker(ImageSource.camera);
                AddpostHelper.set(_file!);
                setState(() {
                  hasImage = true;
                });
              },
            ),
            SimpleDialogOption(
              padding: EdgeInsets.all(25),
              child: Text('Remove'),
              onPressed: () async {
                setState(() {
                  hasImage = false;
                });
                AddpostHelper.deleteImage(_file!);
                Navigator.pop(context);
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
        : GestureDetector(
            onLongPress: () async {
              _removeImage(context);
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: ShapeDecoration(
                color: Color(0xffe0e0e0),
                image: DecorationImage(
                  image: MemoryImage(_file!),
                  fit: BoxFit.contain,
                ),
                shape: SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: 8,
                    cornerSmoothing: 0.6,
                  ),
                ),
              ),
            ),
          );
  }
}

import 'dart:typed_data';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:firebase/Const/add_post_util.dart';
import 'package:firebase/Screens/add_post_screens/screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../Home and Directory/home_page.dart';
import '../../resources/add_post_helper.dart';
import '../../resources/add_post_helper.dart';

class addPost extends StatefulWidget {
  const addPost({Key? key}) : super(key: key);

  @override
  State<addPost> createState() => _addPostState();
}

class _addPostState extends State<addPost> {
  late Uint8List defaultList;
  List<Uint8List> imageList = [];
  AddpostHelper helper = AddpostHelper();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  int maxlines = 5;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  void loadImage() async {
    final ByteData bytes = await rootBundle.load('Icons/Component 1.png');
    defaultList = bytes.buffer.asUint8List();
  }

  _postdeleteprompt(BuildContext context) {
    return showDialog(
      anchorPoint: Offset(12, 12),
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('All the posts will be '),
          children: [
            SimpleDialogOption(
              padding: EdgeInsets.all(25),
              child: Text('Go Back'),
              onPressed: () {
                AddpostHelper.reset();
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            SimpleDialogOption(
              padding: EdgeInsets.all(25),
              child: Text('Cancel'),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _postdeleteprompt(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 64,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xfff3f3f3),
          leading: IconButton(
            icon: Icon(
              FeatherIcons.arrowLeft,
              color: Colors.black,
              size: 32,
            ),
            onPressed: () {
              _postdeleteprompt(context);
            },
          ),
          title: Text(
            'New Listing',
            style: TextStyle(
              fontFamily: 'Satoshi-bold',
              fontSize: 20,
              color: Color.fromRGBO(157, 62, 216, 1),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Add photos',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Satoshi-bold',
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 6),
                    child: AddPhoto(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 6),
                    child: AddPhoto(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 6),
                    child: AddPhoto(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 6),
                    child: AddPhoto(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 6),
                    child: AddPhoto(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 6),
                    child: AddPhoto(),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Satoshi-bold',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12, top: 12, right: 12),
                child: Container(
                  height: maxlines * 24.0,
                  width: 324,
                  child: TextField(
                    maxLines: maxlines,
                    controller: _descriptionController,
                    maxLength: 500,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: 12,
                        top: 8,
                        right: 12,
                        bottom: 8,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(218, 218, 218, 1),
                      hintText:
                          'Tell us about your item. Start with the headline and then add details including material, condition and style.\n\nKeep it accurate and use relevant hashtags',
                      // hintStyle: GoogleFonts.spaceGrotesk(
                      //   fontSize: 14,
                      //   color: Color(0xff767676),
                      // ),
                      hintStyle: TextStyle(
                        fontFamily: 'Satoshi-regular',
                        fontSize: 13,
                      ),
                    ),
                    // controller: _name,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text(
                      'Location',
                      style: TextStyle(
                        fontFamily: 'Satoshi-bold',
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 31, right: 31, top: 16, bottom: 16),
                child: SizedBox(
                  height: 47,
                  child: TextField(
                    controller: _locationController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(218, 218, 218, 1),
                      hintText: 'Enter Location',
                      hintStyle: TextStyle(
                        fontFamily: 'Satoshi-regular',
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => addPost2(
                        description: _descriptionController.text.trim(),
                        location: _locationController.text.trim(),
                      ),
                    ),
                  );
                },
                child: InkWell(
                  splashColor: Colors.white,
                  child: Container(
                    height: 44,
                    width: 100,
                    decoration: ShapeDecoration(
                      color: Color.fromRGBO(157, 62, 216, 1),
                      shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius(
                          cornerRadius: 10,
                          cornerSmoothing: 0.6,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Next',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Satoshi-regular',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(0xfff3f3f3),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
  _selectImage(BuildContext context, int number) async {
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
                Uint8List temp = await imagepicker(ImageSource.camera);
                setState(
                      () {
                    imageList[number] = temp;
                  },
                );
              },
            ),
            SimpleDialogOption(
              padding: EdgeInsets.all(25),
              child: Text('Select a photo from gallery'),
              onPressed: () async {
                Navigator.pop(context);
                Uint8List temp = await imagepicker(ImageSource.gallery);
                setState(() {
                  imageList[number] = temp;
                });
              },
            ),
            SimpleDialogOption(
              padding: EdgeInsets.all(25),
              child: Text('Cancel'),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

   */
/*
 _selectImage(BuildContext context, int number) async {
    if (number == 0) {
      return showDialog(
        context: context,
        barrierColor: Colors.black12,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Create a post'),
            children: [
              SimpleDialogOption(
                padding: EdgeInsets.all(25),
                child: Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List temp = await imagepicker(ImageSource.camera);
                  setState(
                    () {
                      _image0 = temp;
                    },
                  );
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(25),
                child: Text('Select a photo from gallery'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List temp = await imagepicker(ImageSource.gallery);
                  setState(() {
                    imageList[number] = temp;
                  });
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(25),
                child: Text('Cancel'),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    } else if (number == 1) {
      return showDialog(
        context: context,
        barrierColor: Colors.black12,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Create a post'),
            children: [
              SimpleDialogOption(
                padding: EdgeInsets.all(25),
                child: Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List temp = await imagepicker(ImageSource.camera);
                  setState(
                    () {
                      _image1 = temp;
                    },
                  );
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(25),
                child: Text('Select a photo from gallery'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List temp = await imagepicker(ImageSource.gallery);
                  setState(() {
                    imageList[number] = temp;
                  });
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(25),
                child: Text('Cancel'),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    } else if (number == 2) {
      return showDialog(
        context: context,
        barrierColor: Colors.black12,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Create a post'),
            children: [
              SimpleDialogOption(
                padding: EdgeInsets.all(25),
                child: Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List temp = await imagepicker(ImageSource.camera);
                  setState(
                    () {
                      _image2 = temp;
                    },
                  );
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(25),
                child: Text('Select a photo from gallery'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List temp = await imagepicker(ImageSource.gallery);
                  setState(() {
                    imageList[number] = temp;
                  });
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(25),
                child: Text('Cancel'),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    } else if (number == 3) {
      return showDialog(
        context: context,
        barrierColor: Colors.black12,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Create a post'),
            children: [
              SimpleDialogOption(
                padding: EdgeInsets.all(25),
                child: Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List temp = await imagepicker(ImageSource.camera);
                  setState(
                    () {
                      _image3 = temp;
                    },
                  );
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(25),
                child: Text('Select a photo from gallery'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List temp = await imagepicker(ImageSource.gallery);
                  setState(() {
                    imageList[number] = temp;
                  });
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(25),
                child: Text('Cancel'),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    } else if (number == 4) {
      return showDialog(
        context: context,
        barrierColor: Colors.black12,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Create a post'),
            children: [
              SimpleDialogOption(
                padding: EdgeInsets.all(25),
                child: Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List temp = await imagepicker(ImageSource.camera);
                  setState(
                    () {
                      _image4 = temp;
                    },
                  );
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(25),
                child: Text('Select a photo from gallery'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List temp = await imagepicker(ImageSource.gallery);
                  setState(() {
                    imageList[number] = temp;
                  });
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(25),
                child: Text('Cancel'),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    } else {
      return showDialog(
        context: context,
        barrierColor: Colors.black12,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Create a post'),
            children: [
              SimpleDialogOption(
                padding: EdgeInsets.all(25),
                child: Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List temp = await imagepicker(ImageSource.camera);
                  setState(
                    () {
                      _image5 = temp;
                    },
                  );
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(25),
                child: Text('Select a photo from gallery'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List temp = await imagepicker(ImageSource.gallery);
                  setState(() {
                    imageList[number] = temp;
                  });
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(25),
                child: Text('Cancel'),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }
 */

/*
child: Container(
                  width: 100,
                  height: 100,
                  decoration: ShapeDecoration(
                    color: Color(0xffe0e0e0),
                    image: DecorationImage(
                      image: MemoryImage(
                        imageList.isEmpty ? defaultList : imageList[0],
                      ),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 8,
                        cornerSmoothing: 0.6,
                      ),
                    ),
                  ),
                ),
 */

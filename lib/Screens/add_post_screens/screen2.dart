import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:firebase/Const/fonts.dart';
import 'package:firebase/Screens/Home%20and%20Directory/home_page.dart';
import 'package:firebase/resources/add_post_helper.dart';
import 'package:firebase/resources/firestore_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import '../../models/usermodel.dart';
import '../../provider/user_provider.dart';

class addPost2 extends StatefulWidget {
  final String description;
  final String location;
  const addPost2({
    Key? key,
    required this.description,
    required this.location,
  }) : super(key: key);

  @override
  State<addPost2> createState() => _addPost2State();
}

class _addPost2State extends State<addPost2> {
  bool isMenwear = false;
  bool isWomenwear = false;
  bool isUnisex = false;
  bool isKids = false;
  TextEditingController _prizecontroller = TextEditingController();
  bool isExtraSmall = false;
  bool isSmall = false;
  bool isMedium = false;
  bool isLarge = false;
  bool isExtraLarge = false;
  SingleValueDropDownController _brandController =
      SingleValueDropDownController();
  SingleValueDropDownController _categoryController =
      SingleValueDropDownController();

  void postImage(String uid, String usernameReal) async {
    try {
      String res = await FirestoreMethods().uploadPost(
        description: widget.description,
        uid: uid,
        location: widget.location,
        Department: getDepartment(),
        Category: _categoryController.dropDownValue!.name,
        brand: _brandController.dropDownValue!.name,
        Sizes: getSizes(),
        prize: _prizecontroller.text,
        usernameReal: usernameReal,
        likes: [],
        datePublished: DateTime.now(),
      );
      // pushing the home page to be the first page and popping all the other pages.
      if (res == "Correct") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
        // set the list to be null of photos
        AddpostHelper.reset();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  String getDepartment() {
    if (isMenwear == true) {
      return "Menswear";
    } else if (isWomenwear == true) {
      return "Womenswear";
    } else if (isKids == true) {
      return "Kidswear";
    } else {
      return "Unisexwear";
    }
  }

  List<String> getSizes() {
    List<String> sizeList = [];

    if (isExtraSmall == true) {
      sizeList.add("ExtraSmall");
    }
    if (isSmall == true) {
      sizeList.add("Small");
    }
    if (isMedium == true) {
      sizeList.add("Medium");
    }
    if (isLarge == true) {
      sizeList.add("Large");
    }
    if (isExtraLarge == true) {
      sizeList.add("ExtraLarge");
    }
    return sizeList;
  }

  @override
  void dispose() {
    super.dispose();
    _prizecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userModel _user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
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
            // _postdeleteprompt(context);
            Navigator.pop(context);
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      'Department',
                      style: headingfont,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMenwear = !isMenwear;
                        isWomenwear = false;
                        isKids = false;
                        isUnisex = false;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: ShapeDecoration(
                        color: isMenwear
                            ? Color.fromRGBO(157, 62, 216, 1)
                            : Color.fromRGBO(217, 217, 217, 1),
                        shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 10,
                            cornerSmoothing: 0.6,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Menswear',
                          style: containerfont,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isWomenwear = !isWomenwear;
                        isMenwear = false;
                        isKids = false;
                        isUnisex = false;
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: ShapeDecoration(
                        color: isWomenwear
                            ? Color.fromRGBO(157, 62, 216, 1)
                            : Color.fromRGBO(217, 217, 217, 1),
                        shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 10,
                            cornerSmoothing: 0.6,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Womenswear',
                          style: containerfont,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isUnisex = !isUnisex;
                        isWomenwear = false;
                        isMenwear = false;
                        isKids = false;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: ShapeDecoration(
                        color: isUnisex
                            ? Color.fromRGBO(157, 62, 216, 1)
                            : Color.fromRGBO(217, 217, 217, 1),
                        shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 10,
                            cornerSmoothing: 0.6,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Unisex',
                          style: containerfont,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isKids = !isKids;
                        isWomenwear = false;
                        isMenwear = false;
                        isUnisex = false;
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: ShapeDecoration(
                        color: isKids
                            ? Color.fromRGBO(157, 62, 216, 1)
                            : Color.fromRGBO(217, 217, 217, 1),
                        shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 10,
                            cornerSmoothing: 0.6,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Kids',
                          style: containerfont,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text(
                      'Category',
                      style: headingfont,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: DropDownTextField(
                  // initialValue: "name4",
                  controller: _categoryController,
                  listTextStyle: containerfont,
                  clearOption: true,
                  enableSearch: true,
                  textFieldDecoration: InputDecoration(
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
                    hintText: 'Search for category',
                    hintStyle: TextStyle(
                      fontFamily: 'Satoshi-regular',
                      fontSize: 14,
                    ),
                  ),
                  searchDecoration: InputDecoration(
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
                    hintText: 'Enter category here',
                    hintStyle: TextStyle(
                      fontFamily: 'Satoshi-regular',
                      fontSize: 14,
                    ),
                  ),
                  dropDownItemCount: 4,
                  dropDownList: const [
                    DropDownValueModel(name: 'Pant', value: "Lowerbody"),
                    DropDownValueModel(name: 'Shirt', value: "UpperBody"),
                    DropDownValueModel(name: 'Jacket', value: "UpperBody"),
                    DropDownValueModel(name: 'Coat', value: "Upperbody"),
                    DropDownValueModel(name: 'name5', value: "value5"),
                    DropDownValueModel(name: 'name6', value: "value6"),
                    DropDownValueModel(name: 'name7', value: "value7"),
                    DropDownValueModel(name: 'name8', value: "value8"),
                  ],
                  // onChanged: (val) {},
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text(
                      'Brand',
                      style: headingfont,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: DropDownTextField(
                  // initialValue: "name4",
                  controller: _brandController,
                  listTextStyle: containerfont,
                  clearOption: true,
                  enableSearch: true,
                  textFieldDecoration: InputDecoration(
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
                    hintText: 'Search for Brand',
                    hintStyle: TextStyle(
                      fontFamily: 'Satoshi-regular',
                      fontSize: 14,
                    ),
                  ),
                  searchDecoration: InputDecoration(
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
                    hintText: 'Enter brand here',
                    hintStyle: TextStyle(
                      fontFamily: 'Satoshi-regular',
                      fontSize: 14,
                    ),
                  ),
                  dropDownItemCount: 4,
                  dropDownList: const [
                    DropDownValueModel(name: 'name1', value: "value1"),
                    DropDownValueModel(name: 'name2', value: "value2"),
                    DropDownValueModel(name: 'name3', value: "value3"),
                    DropDownValueModel(name: 'name4', value: "value4"),
                    DropDownValueModel(name: 'name5', value: "value5"),
                    DropDownValueModel(name: 'name6', value: "value6"),
                    DropDownValueModel(name: 'name7', value: "value7"),
                    DropDownValueModel(name: 'name8', value: "value8"),
                  ],
                  // onChanged: (val) {},
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text(
                      'Available Sizes',
                      style: headingfont,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExtraSmall = !isExtraSmall;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 51,
                      decoration: ShapeDecoration(
                        color: isExtraSmall
                            ? Color.fromRGBO(157, 62, 216, 1)
                            : Color.fromRGBO(217, 217, 217, 1),
                        shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 10,
                            cornerSmoothing: 0.6,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'XS',
                          style: containerfont,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSmall = !isSmall;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 51,
                      decoration: ShapeDecoration(
                        color: isSmall
                            ? Color.fromRGBO(157, 62, 216, 1)
                            : Color.fromRGBO(217, 217, 217, 1),
                        shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 10,
                            cornerSmoothing: 0.6,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'S',
                          style: containerfont,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMedium = !isMedium;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 51,
                      decoration: ShapeDecoration(
                        color: isMedium
                            ? Color.fromRGBO(157, 62, 216, 1)
                            : Color.fromRGBO(217, 217, 217, 1),
                        shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 10,
                            cornerSmoothing: 0.6,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'M',
                          style: containerfont,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLarge = !isLarge;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 51,
                      decoration: ShapeDecoration(
                        color: isLarge
                            ? Color.fromRGBO(157, 62, 216, 1)
                            : Color.fromRGBO(217, 217, 217, 1),
                        shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 10,
                            cornerSmoothing: 0.6,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'L',
                          style: containerfont,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExtraLarge = !isExtraLarge;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 51,
                      decoration: ShapeDecoration(
                        color: isExtraLarge
                            ? Color.fromRGBO(157, 62, 216, 1)
                            : Color.fromRGBO(217, 217, 217, 1),
                        shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 10,
                            cornerSmoothing: 0.6,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'XL',
                          style: containerfont,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text(
                      'Prize',
                      style: headingfont,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 47,
                  child: TextField(
                    controller: _prizecontroller,
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
                      hintText: 'Enter price in rupees',
                      hintStyle: TextStyle(
                        fontFamily: 'Satoshi-regular',
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  print(_brandController.dropDownValue!.value);
                  print(_categoryController.dropDownValue!.value);
                },
                child: GestureDetector(
                  /// TODO resolve this screen bug.
                  onTap: () => postImage(
                    _user.uid!,
                    _user.usernameReal,
                  ),
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
                          'Post',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

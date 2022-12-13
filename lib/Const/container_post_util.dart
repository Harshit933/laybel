import 'dart:ffi';
import 'package:flutter/material.dart';

class DepartmentContainer extends StatefulWidget {
  final bool color;
  const DepartmentContainer({Key? key, required this.color}) : super(key: key);

  @override
  State<DepartmentContainer> createState() => _DepartmentContainerState();
}

class _DepartmentContainerState extends State<DepartmentContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            // widget.color = !widget.color;
          });
        },
        child: Container(
          color: widget.color ? Colors.grey : Colors.purple,
        ),
      ),
    );
  }
}

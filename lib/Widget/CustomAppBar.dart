import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final headerText;

  const CustomAppBar(this.headerText, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: const Color(0xffB0A695),
      scrolledUnderElevation: 3,
      elevation: 10,
      title: Text(
        '$headerText',
        style: TextStyle(color: Colors.black),
      ),
      shadowColor: Colors.black,
    );
  }
}

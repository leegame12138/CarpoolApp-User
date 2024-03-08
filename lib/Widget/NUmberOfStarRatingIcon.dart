import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingIconReturn extends StatelessWidget {
  final number;

  const RatingIconReturn(this.number,{super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        number >=1 ? Icon(Icons.star,size: 20,) : Icon(Icons.star_outline_rounded,size: 20),
        number >=2 ? Icon(Icons.star,size: 20) : Icon(Icons.star_outline_rounded,size: 20),
        number >=3 ? Icon(Icons.star,size: 20) : Icon(Icons.star_outline_rounded,size: 20),
        number >=4 ? Icon(Icons.star,size: 20) : Icon(Icons.star_outline_rounded,size: 20),
        number >=5 ? Icon(Icons.star,size: 20) : Icon(Icons.star_outline_rounded,size: 20),
      ],),
    );
}}


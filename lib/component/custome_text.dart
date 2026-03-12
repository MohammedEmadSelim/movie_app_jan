import 'package:flutter/material.dart';

class CustomeText extends StatelessWidget {
  const CustomeText({super.key,
    required this.text,
    this.size = 16,
    this.weigh = FontWeight.normal, 
    this.color = Colors.white,


  });
  final  String text;
  final double size;
  final  FontWeight weigh;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return Text(
      text ,
        style: TextStyle(
          fontSize: size,
          fontWeight: weigh,
          color:color,

        ),

    );
  }
}

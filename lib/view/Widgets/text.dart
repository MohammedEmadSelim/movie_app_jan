import 'package:flutter/material.dart';
import 'package:movie_app/core/appcolor.dart';
//import 'package:movies/core/app_color.dart';

class TextDetails extends StatelessWidget {
  const TextDetails({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
      child: Text(
        title,
        maxLines: 10,
        softWrap: true,
        style: TextStyle(
          height: 1.5,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.textWhite,
        ),
      ),
    );
  }
}
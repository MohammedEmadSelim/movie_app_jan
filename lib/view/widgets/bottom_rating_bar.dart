import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies/core/app_color.dart';

import 'text_details.dart';

class BottomRatingBar extends StatefulWidget {
  const BottomRatingBar({super.key});

  @override
  State<BottomRatingBar> createState() => _BottomRatingBarState();
}

class _BottomRatingBarState extends State<BottomRatingBar> {
  double rating = 5;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            color: AppColor.textWhite.withOpacity(.1),
            border: Border.all(color: AppColor.textWhite.withOpacity(.2)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Rate This Movie",
                style: TextStyle(
                  color: AppColor.textWhite,
                  fontSize: 18,
                  letterSpacing: .75,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                rating.toStringAsFixed(1),
                style: TextStyle(
                  color: AppColor.textWhite,
                  fontSize: 32,
                  letterSpacing: .75,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Slider(
                  overlayColor: WidgetStatePropertyAll(AppColor.textField),
                  allowedInteraction: SliderInteraction.tapAndSlide,
                  activeColor: AppColor.yellowStar,
                  value: rating,
                  max: 10,
                  min: 0,
                  label: rating.toString(),
                  onChanged: (value) {
                    setState(() {
                      rating = value;
                    });
                  },
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppColor.blue),
                  fixedSize: WidgetStateProperty.all(Size.fromWidth(200)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Center(
                        child:TextDetails(title: "Thanks! Your Rate has been recorded!"),
                      )));
                },
                child: TextDetails(title: "OK"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
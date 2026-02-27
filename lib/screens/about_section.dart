import 'package:flutter/material.dart' ;


class AboutSection extends StatelessWidget {
  final String bio;

  AboutSection({required this.bio});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: SingleChildScrollView(
        child: Text(
          bio,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}
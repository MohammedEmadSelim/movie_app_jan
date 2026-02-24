import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_theme.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appTheme,
        title: Text(
          "Watch List",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(color: AppColors.navCollorTheme, offset: Offset(2, 2)),
            ],
          ),
        ),

        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(),
    );
  }
}

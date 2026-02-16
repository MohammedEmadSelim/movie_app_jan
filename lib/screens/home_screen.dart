import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child:  Scaffold(
        backgroundColor: Colors.grey.shade900,
        body:Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("What do you want to watch?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              SizedBox(height: 20,),
              SearchBar(),
              SizedBox(height: 20,),
              CarouselSlider(
                options: CarouselOptions(
                  height: screenHeight * .3,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval:  Duration( seconds: 3),

                ), items: [],

              )


            ]
          ),
        )
      ),
    );
  }
}

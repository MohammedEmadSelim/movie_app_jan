import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/movies_cubit.dart';
import 'package:movies/models/movie_model.dart';

import '../service/service.dart';
class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override



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
          BlocBuilder<MoviesCubit, MoviesState>(
                builder: (context , state) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      height: screenHeight * .3,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      autoPlayInterval:  Duration( seconds: 3),

                    ), items: [],

                  );
                }
              )


            ]
          ),
        )
      ),
    );
  }
}

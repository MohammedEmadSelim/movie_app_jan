import 'package:carousel_slider/carousel_slider.dart' as cs;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/service/api_constants.dart';
import '../cubit/movies_cubit.dart';
import 'package:movies/models/movie_model.dart';

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
                builder: (context, state) {
                  if (state is MoviesLoading) {
                    return CircularProgressIndicator();
                  }
                  if (state is MoviesSuccess) {
                    return cs.CarouselSlider(
                      items: state.moviesList.map((movie) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "${ApiConstants.imageBaseUrl}${movie.image}",
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        );
                      }).toList(),
                      options: cs.CarouselOptions(
                        height: screenHeight * 0.3,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        autoPlayInterval: const Duration(seconds: 3),
                      ),
                    );
                  }
                  return const Text("Error", style: TextStyle(color: Colors.white));
                },
              )


            ]
          ),
        )
      ),
    );
  }
}

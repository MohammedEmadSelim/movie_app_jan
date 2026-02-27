import 'dart:async';

import 'package:flutter/material.dart';
import '../cubit/movies_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/movie_item.dart';


class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Timer? timer;
    return Scaffold(
      backgroundColor: Color(0xFF1F242F),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [

        SearchBar()
  ,
            Expanded(
              child: BlocBuilder<MoviesCubit, MoviesState>(
                builder: (context, state) {
                  if (state is MoviesLoading) return Center(child: CircularProgressIndicator());
                  if (state is MoviesSuccess) {
                    return ListView.builder(
                      itemCount: state.moviesList.length,
                      itemBuilder: (context, index) => MovieItem(movie: state.moviesList[index]),
                    );
                  }
                  if (state is MoviesError) return Center(child: Text("Error", style: TextStyle(color: Colors.white)));
                  return Center(child: Text("Search for a movie", style: TextStyle(color: Colors.white)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
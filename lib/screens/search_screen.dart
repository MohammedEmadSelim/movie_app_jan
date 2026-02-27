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

        TextField(
        onChanged: (text) {
      if (timer?.isActive ?? false) timer?.cancel();
      timer = Timer(const Duration(milliseconds: 500), () {
      if (text.isNotEmpty) {
      context.read<MoviesCubit>().search(text);
      }
      });
      },
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF242C3B),
          hintText: "Spiderman",
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      )  ,
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/watchlistcubit_cubit.dart';
import '../models/movie_model.dart';
import '../widgets/movie_item.dart';

class WatchlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F242F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text("Watch list", style: TextStyle(color: Colors.white)),
        leading: const Icon(Icons.arrow_back_ios, color: Colors.white),
      ),
      body: BlocBuilder<WatchlistCubit, List<MovieModel>>(
        builder: (context, movies) {
          if (movies.isEmpty) {
            return const Center(child: Text("Your list is empty", style: TextStyle(color: Colors.white)));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: movies.length,
            itemBuilder: (context, index) => MovieItem(movie: movies[index]),
          );
        },
      ),
    );
  }
}
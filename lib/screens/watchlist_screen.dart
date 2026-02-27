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
            return Center(

                child: Column(
                  children: [
                    Image.asset("assets/images/img_1.png"),
                    const Text("There Is No Movie Yet!",
                        style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold)),
                    Text("Find your movie by Type title \n categories , years , etc",
                    style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    )
                  ],
                ));
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
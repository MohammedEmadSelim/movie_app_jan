import 'package:flutter/material.dart';
import 'package:new_api_explain/utlies/hive_boxes.dart';
import 'package:new_api_explain/view/widgets/movie_card.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var movies = moviesBox.values.toList();
    return ListView.separated(
      separatorBuilder: (context, index) =>SizedBox(height: 16,),
      itemCount: movies.length,
        itemBuilder: (context, index) => MovieCard(movie: movies[index]));
  }
}

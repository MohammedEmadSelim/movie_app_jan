

import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';


class MovieCard extends StatelessWidget {

  const MovieCard({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
            height: 200,
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 25),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width:211,
              child: Text(
                movie.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 21),
            Row(
              children: [
                Icon(
                  Icons.star_border,
                  color: Colors.orange,
                  size: 21,
                ),
                SizedBox(width: 12,),

                Text(
                  movie.voteAverage.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.local_attraction_outlined,
                  color: Colors.white,
                  size: 21,
                ),
                SizedBox(width: 12,),
                Text(
                  'Action',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.white,
                  size: 21,
                ),
                SizedBox(width: 12,),

                Text(
                  movie.releaseDate?.year.toString()??"0000",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Icon(
                  Icons.timelapse,
                  color: Colors.white,
                  size: 21,
                ),
                SizedBox(width: 12,),

                Text(
                  movie.voteCount.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
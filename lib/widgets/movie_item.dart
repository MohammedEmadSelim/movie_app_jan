import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../service/api_constants.dart';

class MovieItem extends StatelessWidget {
  final MovieModel movie;
  MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "${ApiConstants.imageBaseUrl}${movie.image}",
              width: 110,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star_outline, color: Colors.orange, size: 18),
                    Text(
                      " ${movie.rate}",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
                IconText(icon: Icons.confirmation_number_outlined, text: "Action"),
                IconText(
                  icon: Icons.calendar_today,
                  text: movie.release.split('-')[0],
                ),
                IconText(icon: Icons.access_time, text: "139 minutes"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  IconText({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey, size: 16),
          SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
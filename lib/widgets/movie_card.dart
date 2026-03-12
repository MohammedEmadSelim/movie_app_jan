
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../component/custome_text.dart';
import '../models/movie_model.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // مهم لتنسيق الصورة مع النص
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
            height: 150,
            width: 120,
            fit: BoxFit.cover,
          ),
        ),
        Gap(25),
        // هنا غلفت Column بـ Expanded عشان ياخد المساحة المتاحة
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2, // يقطع النص الطويل بعد سطرين
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Gap(10),
              Row(
                children: [
                  Icon(Icons.star_border, color: Colors.deepOrange, size: 20),
                  Gap(12),
                  CustomeText(
                    text: movie.voteAverage.toString(),
                    size: 12,
                    weigh: FontWeight.w500,
                    color: Colors.deepOrange,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.local_attraction_outlined, color: Colors.white, size: 20),
                  Gap(12),
                  CustomeText(text: "Action", size: 14, weigh: FontWeight.w500),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.calendar_today_outlined, color: Colors.white, size: 20),
                  Gap(12),
                  CustomeText(
                    text: movie.releaseDate?.year.toString() ?? "0000",
                    size: 14,
                    weigh: FontWeight.w500,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.timelapse, color: Colors.white, size: 20),
                  Gap(12),
                  CustomeText(
                    text: movie.voteCount.toString(),
                    size: 14,
                    weigh: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

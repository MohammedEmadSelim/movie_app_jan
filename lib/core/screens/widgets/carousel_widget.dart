import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key, required this.resultResponse});

  final List<dynamic> resultResponse;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: resultResponse.length,
      itemBuilder: (context, index, realIndex) {
        //! create a final  variable to save the photos path from api.
        final posterPath = resultResponse[index]["poster_path"];
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 300,
            width: 200,
            child: Image.network(
              "https://image.tmdb.org/t/p/w500$posterPath",
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      options: CarouselOptions(
        //! to make the center poster is the big size
        enlargeCenterPage: true,
        //! to make all posters side to side
        viewportFraction: 0.5,
        height: 300,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 2),
        animateToClosest: true,
      ),
    );
  }
}

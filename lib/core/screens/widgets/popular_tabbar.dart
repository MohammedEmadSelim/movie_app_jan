import 'package:flutter/material.dart';
import 'package:movie_app/core/constant/constantFiles/api_query.dart';
import 'package:movie_app/core/constant/constantFiles/dio_helpers.dart';
import 'package:movie_app/core/constant/constantFiles/strings.dart';

class PopularTabbar extends StatefulWidget {
  PopularTabbar({super.key});

  @override
  State<PopularTabbar> createState() => _PopularTabbarState();
}

class _PopularTabbarState extends State<PopularTabbar> {
  List movies = [];
  bool isLoading = true;

  @override
  //! Calling GetUpcoming Function when the page start running
  void initState() {
    super.initState();
    getUpcomingMovies();
  }

  Future<void> getUpcomingMovies() async {
    try {
      var response = await DioHelper.getData(
        endpoint: Strings.popularEndpoint,
        query: ApiQuery.popularQuery,
      );
      if (response.data != null && response.data["results"] != null) {
        setState(() {
          movies = (response.data["results"] as List)
              .where((movie) => movie["poster_path"] != null)
              .toList();
          isLoading = false;
        });
      }
    } catch (e) {
      debugPrint("API Error: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    if (isLoading) {
      return Center(child: CircularProgressIndicator(color: Colors.amber));
    }
    if (movies.isEmpty) {
      return Center(
        child: Text(
          "Movies Not Found",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
    }
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.02,
      ),
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: height * 0.01,
        childAspectRatio: 0.7,
        crossAxisSpacing: width * 0.01,
      ),

      itemBuilder: (context, index) {
        final poster = movies[index]["poster_path"];
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            "https://image.tmdb.org/t/p/w500$poster",
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Container(
                color: Colors.grey[900],
                child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[900],
                child: const Icon(
                  Icons.broken_image_rounded,
                  color: Colors.white24,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

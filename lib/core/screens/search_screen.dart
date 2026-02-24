
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/constant/constantFiles/api_query.dart';
import 'package:movie_app/core/constant/constantFiles/dio_helpers.dart';
import 'package:movie_app/core/constant/constantFiles/fields.dart';
import 'package:movie_app/core/constant/constantFiles/strings.dart';
import 'package:movie_app/core/screens/details_screen.dart';
import 'package:movie_app/core/theme/app_theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List movies = [];
  bool isLoading = true;
  String searchText = "";
  void onchanged(String value) {
    //! this condition to delete the list of movies if the field search is empty.
    if (value.isEmpty) {
      setState(() {
        movies = [];
        searchText = "";
      });
    }
    getSearchMovies(value);
  }

  void inti() {
    super.initState();
  }

  Future<void> getSearchMovies(String inputText) async {
    if (inputText.isEmpty) {
      setState(() {
        movies = [];
        searchText = "";
      });
      return;
    }
    setState(() {
      isLoading = true;
      searchText = inputText;
    });
    try {
      var response = await DioHelper.getData(
        endpoint: Strings.SearchMovieEndPoint,
        query: ApiQuery.searchMovieQuery(inputText),
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
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: AppColors.appTheme,
          title: Text(
            "Search",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              shadows: [Shadow(color: Colors.green, offset: Offset(2, 2))],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Gap(20),
              SearchFormField(
                hint: "Search",

                suffixIcon: Icon(Icons.search_rounded, size: 33),
                onchanged: onchanged,
              ),

              Expanded(
                //! show the lottie icon if the movies list is empty.
                child: movies.isEmpty
                    ? Center(
                        child: Lottie.asset(
                          "assets/lottie/No-Data.json",
                          width: 200,
                        ),
                      )
                    : ListView.builder(
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          final poster = movies[index]["poster_path"];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(movieData: movies[index]),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 5,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  poster != null
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          child: Image.network(
                                            "https://image.tmdb.org/t/p/w500$poster",
                                            width: width * 0.3,
                                            height: height * 0.2,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Container(
                                          width: width * 0.3,
                                          height: height * 0.2,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[800],
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.movie,
                                            color: Colors.white24,
                                          ),
                                        ),

                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      //! عشان ياخد مساحه للنص علي قد الاسم فقط وليس كلها
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          movies[index]["title"] ?? "No Title",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 8),
                                        //! The API date of movie
                                        Text(
                                          movies[index]["release_date"]?.split(
                                                '-',
                                              )[0] ??
                                              "Unknown Year",
                                          style: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 10),

                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 16,
                                            ),
                                            const SizedBox(width: 4),
                                            //! The  API average ratting of the movie
                                            Text(
                                              "${movies[index]["vote_average"] ?? "0"}",
                                              style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

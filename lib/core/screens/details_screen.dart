import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/core/theme/app_theme.dart';

class DetailsScreen extends StatelessWidget {
  //! pass the map of movie data to this page to use it in this page.
  final Map? movieData;
  //! call the map of movie in the constructor
  const DetailsScreen({super.key, this.movieData});

  @override
  Widget build(BuildContext context) {
    //! this change the height of app to be responsive for all mobiles to be the same
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.appTheme,
        title: const Text(
          "Detail",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark_add_outlined),
            iconSize: 30,
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              //! the cover photo of the page
              Container(
                height: height * 0.30,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: movieData?["poster_path"] != null
                    ? Image.network(
                        "https://image.tmdb.org/t/p/w500${movieData!["poster_path"]}",
                        fit: BoxFit.cover,
                      )
                    : const Icon(
                        Icons.movie_creation_outlined,
                        color: Colors.white24,
                        size: 50,
                      ),
              ),
              //! to control on the small photo in specifi positions.
              Positioned(
                bottom: -60,
                left: 20,
                right: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: height * 0.18,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500${movieData!["backdrop_path"]}",
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    const Gap(30),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            movieData!["title"] ?? "Unknown Movie",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Gap(8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const Gap(70),

          Gap(10),
          SizedBox(
            height: 26,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.date_range, color: Colors.amber),
                Gap(12),
                Text(
                  movieData!["release_date"],
                  style: TextStyle(color: Colors.white60, fontSize: 12),
                ),
                Gap(20),
                VerticalDivider(color: Colors.white60),
                Gap(20),
                Icon(Icons.star_border, color: Colors.amber),
                Gap(12),
                Text(
                  movieData!["vote_average"].toString(),
                  style: TextStyle(color: Colors.white60),
                ),
              ],
            ),
          ),

          Gap(50),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.white,
                    isScrollable: true,
                    dividerColor: AppColors.textFillTheme,
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(text: "About Movie",),
                      Tab(text: "Reviews",),
                      Tab(text: "Cast",),
                    ],
                  ),
                  TabBarView(children: [
                    
                  ])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

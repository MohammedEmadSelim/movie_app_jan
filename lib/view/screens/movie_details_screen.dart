import 'package:flutter/material.dart';
import 'package:new_api_explain/models/movie_model.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff242A32),

      appBar: AppBar(
        backgroundColor: Color(0xff242A32),
        centerTitle: true,
        title: Text(
          "Details",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        actions: [
          Icon(Icons.bookmark, size: 32, color: Colors.white),
          SizedBox(width: 10),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.38,
              child: Stack(
                children: [
                  Image.network(
                    "https://image.tmdb.org/t/p/w500/${movie.backdropPath}",
                  ),

                  Positioned(
                    bottom: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                              height: screenHeight * 0.25,
                              width: screenWidth * 0.30,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 18),
                          Column(
                            children: [
                              SizedBox(height: screenHeight * 0.125),
                              Text(
                                movie.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_today_outlined, color: Color(0xff92929D)),
                SizedBox(width: 10),
                Text(
                  movie.releaseDate!.year.toString(),
                  style: TextStyle(color: Color(0xff92929D)),
                ),
                SizedBox(width: 5),

                SizedBox(
                  height: 24,
                  child: VerticalDivider(color: Color(0xff92929D)),
                ),

                //=======
                Icon(Icons.timelapse, color: Color(0xff92929D)),
                SizedBox(width: 10),
                Text(
                  movie.voteCount.toString(),
                  style: TextStyle(color: Color(0xff92929D)),
                ),
                SizedBox(width: 5),

                SizedBox(
                  height: 24,
                  child: VerticalDivider(color: Color(0xff92929D)),
                ),
                //=======
                Icon(Icons.local_attraction_outlined, color: Color(0xff92929D)),
                SizedBox(width: 10),
                Text(
                  "action",
                  style: TextStyle(color: Color(0xff92929D)),
                ),
                SizedBox(width: 5),

              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                indicatorColor: Color(0xff92929D),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerHeight: 0,
                tabs: [
                  Tab(text: "About Movie"),
                  Tab(text: "Reviews"),
                  Tab(text: "Cast"),

                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                Container(

                  padding: EdgeInsets.all(24),
                  child: Text(movie.overview,
                  style: TextStyle(fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),),

                ),
                Container(),
                Container(),
              ]),
            )


          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/app_color.dart';
import 'package:movies/view/screens/details_screen.dart';
import 'package:movies/view/screens/watchlist_data.dart';
import 'package:movies/view/widgets/Custom_app_bar.dart';
import '../widgets/custom_search_details.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({super.key});

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  bool isWatch =false;
  double rating = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      appBar: CustomAppBar(
          title: "Watch list", angle: 0, toolTipMessage: ""),
      body:watchListMovies.isEmpty?
      Center(child:Column(
        mainAxisAlignment: .center,
        children: [
          SvgPicture.asset("assets/icons/noWatch.svg"),
          SizedBox(height: 10,),
          const Text("There is no movie yet!",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,letterSpacing: .12,color: AppColor.textWhite),),
          SizedBox(height: 10,),
          const Text("Find your movie by Type title, ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,letterSpacing: .12,color: AppColor.iconHint),),
          const Text(" categories, years, etc",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,letterSpacing: .12,color: AppColor.iconHint),),
        ],
      ) ,):
      Center(
          child: ListView.builder(
          itemCount:watchListMovies.length ,
          itemBuilder: (context,index){
            final movie = watchListMovies[index];
            final movieName = movie.originalTitle ?? "Unknown";
            final posterUrl = movie.posterPath != null
                ? "https://image.tmdb.org/t/p/w500${movie.posterPath}"
                : "https://img.icons8.com/?size=100&id=6i8IfGyeoebS&format=png&color=000000";
            return Padding(
              padding: const EdgeInsets.only(top: 20,left: 25),
              child: SizedBox(
                height: 180,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: [
                          GestureDetector(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                26,
                              ),
                              child: Image.network(
                                posterUrl,
                                width: 120,
                                height: 170,
                                fit: BoxFit.fill,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(movie:movie),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomDetailsCoulmn(
                          movieName: movieName,
                          movieRate: movie.voteAverage,
                          movieType: "Unknown",
                          movieYear: movie.releaseDate,
                          movieTime: movie.video.toString(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}

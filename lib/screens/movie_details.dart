import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/component/shimmer_grid.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/movies_service/movie_cast/movie_cast_cubit.dart';
import 'package:movie_app/movies_service/movie_reviews/movie_reviews_cubit.dart';
import 'package:movie_app/screens/home.dart';
import 'package:movie_app/utlies/movie_box.dart';

import '../component/custome_text.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key, required this.movie});

  final MovieModel movie ;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return MultiBlocProvider(
           providers: [
             BlocProvider(create: (_)=> MovieReviewsCubit()..getMovieReviews(95)),
             BlocProvider(create: (_) => MovieCastCubit()..getMovieCast(120)),
           ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: CustomeText(text: "Details",size: 18,weigh: FontWeight.w600,),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
            onPressed: (){
               Navigator.pop(context);
            },
          ),
          actions: [
            GestureDetector(
              onTap: (){
                moviesBox.containsKey(widget.movie.id) ? moviesBox.delete(widget.movie.id)
                    : moviesBox.put(widget.movie.id, widget.movie);
                setState(() {});
              },
              child: Icon(
                moviesBox.containsKey(widget.movie.id) ? Icons.bookmark : Icons.bookmark_border,
                size: 30,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10,)
          ],
        ),
        body: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.35,
                  child: Stack(
                    children: [
                      Image.network("https://image.tmdb.org/t/p/w500/${widget.movie.backdropPath}"),
                      Positioned(
                        bottom: 1,
                          child: Padding(
                              padding: EdgeInsetsGeometry.symmetric(horizontal:18),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network("https://image.tmdb.org/t/p/w500/${widget.movie.posterPath}",
                                    height: screenHeight * 0.22,
                                    width: screenWidth * 0.34,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Gap(20),
                                Column(
                                  children: [
                                    SizedBox(height: screenHeight * 0.125,),
                                    CustomeText(text: widget.movie.title , size: 22, weigh: FontWeight.w700,)
                                  ],
                                )
                              ],
                            ),
                          )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 24,),
                // Details of Film
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_today,color: Color(0xff92929D),),
                    Gap(10),
                    CustomeText(text: widget.movie.releaseDate!.year.toString(),
                      color:Color(0xff92929D), size: 18, weigh: FontWeight.w500,),
                    Gap(5),
                    SizedBox(
                      height: 24,
                      child: VerticalDivider(color: Color(0xff92929D),),
                    ),
                    Gap(5),
                    Icon(Icons.access_time_rounded,color: Color(0xff92929D)),
                    Gap(5),
                    CustomeText(text: widget.movie.voteCount.toString(),color: Color(0xff92929D),size: 18, weigh: FontWeight.w500),
                    SizedBox(
                      height: 24,
                      child: VerticalDivider(color: Color(0xff92929D),),
                    ),
                    Gap(5),
                    Icon(Icons.no_adult_content, color: Color(0xff92929D)),
                    Gap(5),
                    CustomeText(text: widget.movie.adult.toString(),color: Color(0xff92929D),size: 18, weigh: FontWeight.w500)
                  ],
                ),

                Gap(20),

                Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                  child: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    indicatorColor:  Color(0xff92929D),
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerHeight: 0,
                    tabs: [
                      Tab(text: "About Movie"),
                      Tab(text: "Reviews"),
                      Tab(text: "Cast"),
                    ],
                  ),
                ),
                Gap(20),
                Expanded(
                    child: TabBarView(
                        children: [
                          // About Movie
                          Container(
                            padding: EdgeInsets.all(22),
                            child: CustomeText(text: widget.movie.overview,size: 17,weigh: FontWeight.w600,),
                          ),

                          // Review
                          Container(
                            child: BlocBuilder<MovieReviewsCubit,MovieReviewsState>(
                                builder: (context , state){
                                  if(state is MovieReviewsLoading){
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  if(state is MovieReviewsFailure){
                                    return CustomeText(text: state.message, size: 16,weigh: FontWeight.w500,);
                                  }

                                  if(state is MovieReviewsSuccess){
                                    var movieReviews = state.movieReview.results;
                                    return ListView.builder(
                                      itemCount: movieReviews.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context , index){
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 45.0 , vertical: 20),
                                            child: Row(
                                               mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                CircleAvatar(radius: 30, child: Image.asset("assets/images/Ellipse 1.png"),),
                                                Gap(15),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      CustomeText(text: movieReviews[index].author, size: 18, weigh: FontWeight.w600,),
                                                      Gap(5),
                                                       Text(movieReviews[index].content, style: TextStyle(
                                                         fontSize: 16,
                                                         fontWeight: FontWeight.w400,
                                                          color: Colors.white,
                                                          overflow: TextOverflow.ellipsis,
                                                       ),)
                                                    ],
                                                  ),
                                                ),
                                              ],

                                            ),
                                          );
                                        });
                                  }
                                  return SizedBox();
                                }),
                          ),

                          // Cast
                          Container(
                            child: BlocBuilder<MovieCastCubit,MovieCastState>(
                                builder: (context , state){
                                  if(state is MovieCastLoading){
                                    return ShimmerSkeleton(count: 9);
                                  }

                                  if(state is MovieCastFailure){
                                    return CustomeText(text: state.message,size: 16,weigh: FontWeight.w500,);
                                  }

                                  if(state is MovieCastSuccess){
                                    var movieCast = state.movieCast.cast;
                                    return GridView.builder(
                                      itemCount: movieCast.length,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing:10,
                                           crossAxisSpacing: 10,
                                            childAspectRatio: 1.2
                                        ),
                                        itemBuilder: (context , index){
                                            return Column(
                                              children: [
                                                CircleAvatar(radius: 50,
                                                  backgroundImage: NetworkImage("https://image.tmdb.org/t/p/w500/${movieCast[index].profilePath}"),
                                                  ),
                                                  Gap(8),
                                                  CustomeText(text: movieCast[index].name, size: 14,weigh: FontWeight.w500,)
                                              ],
                                            );
                                        });
                                  }
                                  return SizedBox();
                                }),
                          ),


                        ]
                    )
                )
              ],
            )
        ),

      ),
    );
  }
}

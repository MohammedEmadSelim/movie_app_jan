import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/component/shimmer_carousel.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/movies_service/now_playing/now_playing_movie_cubit.dart';
import 'package:movie_app/movies_service/search/search_cubit.dart';
import 'package:movie_app/screens/movie_details.dart';
import 'package:movie_app/screens/search_screen.dart';
import 'package:movie_app/widgets/now_playing_tab.dart';
import '../component/custome_text.dart';
import '../movies_service/home_top_rated/home_movies_cubit.dart';
import '../movies_service/movie_up_coming/movie_up_coming_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key,  this.title = ''});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeMoviesCubit()..getHomeMovies()),
        BlocProvider(create: (_) => NowPlayingMovieCubit()..getNowPlayingMovies()),
        BlocProvider(create: (_) => MovieUpComingCubit()..getMovieUpComing()),
      ],
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(12),
                  CustomeText(
                    text: "What do you want to watch?",
                    size: 22,
                    weigh: FontWeight.w700,
                  ),
                  Gap(15),
                  TextFormField(
                    readOnly: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (c) => BlocProvider(
                            create: (context) => SearchCubit(),
                          child: SearchScreen(),
                        )),
                      );
                    },
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        size: 25,
                        color: Colors.grey.shade500,
                      ),
                      filled: true,
                      fillColor: AppColors.search,
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: AppColors.search),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: AppColors.search),
                      ),
                    ),
                  ),
                  Gap(20),

                  // Carousel for Home Movies
                  BlocBuilder<HomeMoviesCubit, HomeMoviesState>(
                    builder: (context, state) {
                      if (state is HomeMoviesLoading) {
                        return ShimmerCarousel(count: 9);
                      }

                      if (state is HomeMoviesFailure) {
                        return CustomeText(
                          text: state.message,
                          size: 18,
                          weigh: FontWeight.w500,
                        );
                      }

                      if (state is HomeMoviesSuccess) {
                        var movies = state.movies.results;
                        return CarouselSlider.builder(
                          itemCount: movies.length,
                          itemBuilder: (context, index, pageViewIndex) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => MovieDetails(movie: movies[index]),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/w500/${movies[index].posterPath}",
                                  width: 150,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          options: CarouselOptions(
                            autoPlay: true,
                            viewportFraction: 0.4,
                            enlargeCenterPage: true,
                          ),
                        );
                      }

                      return SizedBox();
                    },
                  ),
                  Gap(20),

                  // Tabs
                  TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Tab(text: "Now Playing"),
                      Tab(text: "Up Coming"),
                      Tab(text: "Top Rated"),
                      Tab(text: "Popular"),
                    ],
                  ),
                  Gap(25),

                  // Tab Views
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Now Playing Tab
                             NowPlayingTab(),

                        // Up Coming Tab
                        BlocBuilder<MovieUpComingCubit, MovieUpComingState>(
                          builder: (context, state) {
                            if (state is MovieUpComingLoading) {
                              return const Center(child: CircularProgressIndicator());
                            }
                            if (state is MovieUpComingFailure) {
                              return CustomeText(
                                text: state.message,
                                size: 18,
                                weigh: FontWeight.w500,
                              );
                            }
                            if (state is MovieUpComingSuccess) {
                              var moviesUp = state.movieUp.results;
                              return GridView.builder(
                                itemCount: moviesUp?.length,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 0.7,
                                ),
                                itemBuilder: (context, index) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/w500/${moviesUp?[index].posterPath}",
                                      width: 250,
                                      height: 300,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              );
                            }
                            return const SizedBox();
                          },
                        ),

                        // Top Rated Tab
                        BlocBuilder<HomeMoviesCubit, HomeMoviesState>(
                          builder: (context, state) {
                            if (state is HomeMoviesLoading) {
                              return const Center(child: CircularProgressIndicator(color: Colors.white));
                            }
                            if (state is HomeMoviesFailure) {
                              return CustomeText(
                                text: state.message,
                                size: 18,
                                weigh: FontWeight.w500,
                              );
                            }
                            if (state is HomeMoviesSuccess) {
                              var movies = state.movies.results;
                              return GridView.builder(
                                itemCount: movies.length,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 0.7,
                                ),
                                itemBuilder: (context, index) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/w500/${movies[index].posterPath}",
                                      width: 250,
                                      height: 300,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              );
                            }
                            return const SizedBox();
                          },
                        ),

                        // Popular Tab (Empty for now)
                        Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
         // bottomNavigationBar: CustomNavigator(),
        ),
      ),
    );

  }
}

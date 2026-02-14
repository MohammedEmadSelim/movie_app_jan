import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_api_explain/view/screens/movie_details_screen.dart';
import 'package:new_api_explain/view/screens/search_screen.dart';
import 'package:new_api_explain/view/widgets/now_playing_tab.dart';
import 'package:new_api_explain/view_model/home_carousel_movies_cubi/home_carousel_movies_cubit.dart';
import 'package:new_api_explain/view_model/now_playing_cubit/now_playning_cubit.dart';
import 'package:new_api_explain/view_model/search_cubit/search_cubit.dart';

/*
* 1 - build carousel
* 2 - build tabBar
* 3-  build botton nav bar
* */
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    context.read<HomeCarouselMoviesCubit>().getHomeCarouselMovies();
    super.initState();
  }

  double rating = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242A32),
      appBar: AppBar(
        backgroundColor: Color(0xff242A32),
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              TextFormField(
                readOnly: true,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => SearchCubit(),
                        child: SearchScreen(),
                      ),
                    ),
                  );
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Search",
                  fillColor: Color(0xff3A3F47),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 24),

              BlocBuilder<HomeCarouselMoviesCubit, HomeCarouselMoviesState>(
                builder: (context, state) {
                  if (state is HomeCarouselMoviesLoading) {
                    return CircularProgressIndicator();
                  }
                  if (state is HomeCarouselMoviesFailure) {
                    return Text(
                      state.message,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  }
                  if (state is HomeCarouselMoviesSuccess) {
                    var movies = state.movies.results;
                    return CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 0.4,
                        enlargeCenterPage: true,
                      ),
                      itemCount: movies.length,
                      itemBuilder:
                          (
                            BuildContext context,
                            int itemIndex,
                            int pageViewIndex,
                          ) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MovieDetailsScreen(
                                    movie: movies[itemIndex],
                                  ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                "https://image.tmdb.org/t/p/w500/${movies[itemIndex].posterPath}",
                                height: 200,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                    );
                  }
                  return SizedBox();
                },
              ),

              TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerHeight: 0,
                tabs: [
                  Tab(text: "Now Playing"),
                  Tab(text: "Up Coming"),
                  Tab(text: "Top Rated"),
                  Tab(text: "Popular"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    BlocProvider(
                      create: (context) =>
                          NowPlayingCubit()..getNowPlayingMovies(),
                      child: NowPlayingTab(),
                    ),
                    Container(),
                    Container(),
                    Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

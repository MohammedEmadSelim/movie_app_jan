import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/view/widgets/now_playing_tab.dart';
import 'package:movie_app/view_model/home_carousel_movies_cubit.dart';
import 'package:movie_app/view_model/now_playing_cubit.dart';
import 'package:movie_app/view_model/now_playing_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCarouselMoviesCubit>(context).getHomeCarouselMovies();
    BlocProvider.of<NowPlayingCubit>(context).getNowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242A32),
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Text(
                  'What do you want to watch?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Search
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    if (value.trim().isNotEmpty) {
                      Navigator.pushNamed(context, '/search', arguments: value.trim());
                    }
                  },
                  style: const TextStyle(color: Color(0xff67686D)),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.white54),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/images/Search.png", width: 18, height: 15),
                    ),
                    filled: true,
                    fillColor: const Color(0xFF3A3F47),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Carousel
              BlocBuilder<HomeCarouselMoviesCubit, HomeCarouselMoviesState>(
                builder: (context, state) {
                  if (state is HomeCarouselMoviesLoading) {
                    return const SizedBox(
                      height: 220,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is HomeCarouselMoviesSuccess) {
                    final movies = state.movies.results;
                    return SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          final movie = movies[index];
                          return GestureDetector(
                            onTap: () => Navigator.pushNamed(
                              context, '/details', arguments: movie.id,
                            ),
                            child: Container(
                              width: 140,
                              margin: const EdgeInsets.only(right: 12),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    color: const Color(0xFF16213E),
                                    child: const Center(child: CircularProgressIndicator()),
                                  ),
                                  errorWidget: (context, url, error) => Container(
                                    color: const Color(0xFF16213E),
                                    child: const Icon(Icons.broken_image, color: Colors.white54),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const SizedBox(
                      height: 220,
                      child: Center(child: Text('Error', style: TextStyle(color: Colors.white54))),
                    );
                  }
                },
              ),

              const SizedBox(height: 16),

              // TabBar
              TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white54,
                indicatorColor: const Color(0xFF4FC3F7),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerHeight: 0,
                tabs: const [
                  Tab(text: "Now Playing"),
                  Tab(text: "Up Coming"),
                  Tab(text: "Top Rated"),
                  Tab(text: "Popular"),
                ],
              ),

              // TabBarView
              Expanded(
                child: TabBarView(
                  children: [
                    BlocProvider(
                      create: (context) => NowPlayingCubit()..getNowPlayingMovies(),
                      child: NowPlayingTab(),
                    ),
                    const Center(child: Text('Up Coming', style: TextStyle(color: Colors.white))),
                    const Center(child: Text('Top Rated', style: TextStyle(color: Colors.white))),
                    const Center(child: Text('Popular', style: TextStyle(color: Colors.white))),
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










//Navigator.pushNamed(context, '/home');
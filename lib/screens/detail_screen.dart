import 'package:flutter/material.dart' ;
import 'package:movies/screens/reviews_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/watchlistcubit_cubit.dart';
import '../models/movie_model.dart';
import '../service/api_constants.dart';
import 'about_section.dart';
import 'cast_section.dart';

class DetailScreen extends StatelessWidget {
  final MovieModel movie;
  DetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFF1F242F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          BlocBuilder<WatchlistCubit, List<MovieModel>>(
            builder: (context, list) {
              bool isSaved = list.any((e) => e.id == movie.id);
              return IconButton(
                onPressed: () => context.read<WatchlistCubit>().toggle(movie),
                icon: Icon(
                  isSaved ? Icons.bookmark : Icons.bookmark_border,
                  color: Colors.white,
                ),
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.network("${ApiConstants.imageBaseUrl}${movie.backdrop}"),
                Positioned(
                  bottom: -60,
                  left: 20,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network("${ApiConstants.imageBaseUrl}${movie.image}", width: 100),
                      ),
                      SizedBox(width: 15),
                      Text(movie.title, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
            DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: const Color(0xFF3A3F47),
                    indicatorWeight: 4,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white60,
                    tabs: [
                      Tab(text: "About Movie"),
                      Tab(text: "Reviews"),
                      Tab(text: "Cast"),
                    ],
                  ),
                  SizedBox(
                    height: 400,
                    child: TabBarView(
                      children: [
                        AboutSection(bio: movie.overview),
                        ReviewsSection(id: movie.id),
                        CastSection(id: movie.id),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
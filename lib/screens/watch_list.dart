import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/component/no_movie_list.dart';
import 'package:movie_app/utlies/movie_box.dart';
import 'package:movie_app/widgets/movie_card.dart';

import '../component/custome_text.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    var movies = moviesBox.values.toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff242A32),
        title: CustomeText(
          text: "Watch list",
          size: 20,
          weigh: FontWeight.w600,
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),
      ),

      body: movies.isEmpty ? NoMovieList():
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            Gap(25),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return Dismissible(
                    key: Key(movie.id.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      moviesBox.delete(movie.id);
                    },

                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.red,
                      child: Icon(Icons.delete, color: Colors.white, size: 28),
                    ),
                    child: Row(
                      children: [
                        Expanded(child: MovieCard(movie: movie)),
                        IconButton(
                          onPressed: () {
                            moviesBox.delete(movie.id);
                            setState(() {
                              movies.removeAt(index);
                            });
                          },
                          icon: Icon(Icons.delete, color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

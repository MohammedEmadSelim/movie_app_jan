import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:new_api_explain/view_model/search_cubit/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  bool showEmptyCase = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242A32),
      appBar: AppBar(
        backgroundColor: Color(0xff242A32),
        title: Text(
          "Search",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          // search _ api
          TextFormField(
            onChanged: (value) {
              // api call
              context.read<SearchCubit>().search(value);
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
          //handle case loading , case success , case failure
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              print(state);
              if (state is SearchLoading) {
                return CupertinoActivityIndicator();
              }
              if (state is SearchSuccess) {
                if (state.searchResponseModel.results.isEmpty) {
                  return Lottie.asset('assets/animations/No Item In Box.json');
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.searchResponseModel.results.length,
                    itemBuilder: (context, index) {
                      var movie = state.searchResponseModel.results[index];
                      return Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                              height: 200,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 25),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width:211,
                                child: Text(
                                  movie.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 21),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_border,
                                    color: Colors.orange,
                                    size: 21,
                                  ),
                                  SizedBox(width: 12,),

                                  Text(
                                    movie.voteAverage.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.local_attraction_outlined,
                                    color: Colors.white,
                                    size: 21,
                                  ),
                                  SizedBox(width: 12,),
                                  Text(
                                    'Action',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    color: Colors.white,
                                    size: 21,
                                  ),
                                  SizedBox(width: 12,),

                                  Text(
                                    movie.releaseDate?.year.toString()??"0000",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  Icon(
                                    Icons.timelapse,
                                    color: Colors.white,
                                    size: 21,
                                  ),
                                  SizedBox(width: 12,),
                                  
                                  Text(
                                    movie.voteCount.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                );
              }

              return Lottie.asset('assets/animations/No Item In Box.json');
            },
          ),
        ],
      ),
    );
  }
}

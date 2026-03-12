import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies_service/home_top_rated/home_movies_cubit.dart';
import 'package:movie_app/movies_service/search/search_cubit.dart';
import 'package:movie_app/screens/home.dart';
import 'package:movie_app/screens/search_screen.dart';

import '../screens/watch_list.dart';

class CustomNavigator extends StatefulWidget {
  const CustomNavigator({super.key});

  @override
  State<CustomNavigator> createState() => _CustomNavigatorState();
}

class _CustomNavigatorState extends State<CustomNavigator> {
  int currentIndex = 0;
  List <Widget> screens =[
    BlocProvider(
        create: (context) => HomeMoviesCubit(),
        child: Home(title: "Home Page"),
    ),

    BlocProvider(create: (context) => SearchCubit(),
      child: SearchScreen(),
    ),
    WatchList(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242A32),
      body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value){
            currentIndex = value;
            setState(() {
              
            });
          },
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled,size: 30,), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.bookmark_outline,), label: ""),
            ],
          unselectedItemColor: Color(0xff92929D),
          selectedItemColor: Color(0xff0296E5),
          backgroundColor: Color(0xff242A32),
        ),
    );
  }
}

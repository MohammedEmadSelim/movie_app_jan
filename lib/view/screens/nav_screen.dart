import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_api_explain/view/screens/fav_Screen.dart';
import 'package:new_api_explain/view/screens/home_screen.dart';
import 'package:new_api_explain/view/screens/search_screen.dart';
import 'package:new_api_explain/view_model/home_carousel_movies_cubi/home_carousel_movies_cubit.dart';
import 'package:new_api_explain/view_model/search_cubit/search_cubit.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    BlocProvider(
      create: (context) => HomeCarouselMoviesCubit(),
      child: MyHomePage(title: 'Flutter Demo Home Page'),
    ),
    BlocProvider(
      create: (context) => SearchCubit(),
      child: SearchScreen(),
    ),
    FavScreen()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242A32),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          print(value);
          currentIndex = value;
          setState(() {

          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined,
            size: 32,

          ), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: ""),
        ],

        //====
        unselectedItemColor:  Color(0xff92929D),
        selectedItemColor: Color(0xff0296E5),
        backgroundColor: Color(0xff242A32),
      ),
    );
  }
}

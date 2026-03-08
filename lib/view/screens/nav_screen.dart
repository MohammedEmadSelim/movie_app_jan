import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view/screens/fav_Screen.dart';
import 'package:movie_app/view/screens/home_screen.dart';
import 'package:movie_app/view/screens/search_screen.dart' show SearchScreen;
import 'package:movie_app/view_model/home_carousel_movies_cubit.dart';
import 'package:movie_app/view_model/search_cubit.dart';


class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int currentIndex = 0;
  late final _NavScreenState navScreenState;
  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      BlocProvider(
        create: (context) => HomeCarouselMoviesCubit(),
          child: HomeScreen(),
      ),
      BlocProvider(
        create: (context) => SearchCubit(),
        child: SearchScreen(keyword: '',),
      ),
      FavScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242A32),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 32),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: "",
          ),
        ],
        unselectedItemColor: const Color(0xff92929D),
        selectedItemColor: const Color(0xff0296E5),
        backgroundColor: const Color(0xff242A32),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:movie_app/core/constant/constantFiles/api_query.dart';
import 'package:movie_app/core/constant/constantFiles/dio_helpers.dart';
import 'package:movie_app/core/constant/constantFiles/strings.dart';
import 'package:movie_app/core/screens/widgets/card_drawer_widget.dart';
import 'package:movie_app/core/screens/widgets/carousel_widget.dart';
import 'package:movie_app/core/screens/widgets/nowplayng_tabbar.dart';
import 'package:movie_app/core/screens/widgets/popular_tabbar.dart';
import 'package:movie_app/core/screens/widgets/toprated_tabbar.dart';
import 'package:movie_app/core/screens/widgets/upcoming_tabbar.dart';
import 'package:movie_app/core/theme/app_theme.dart';
// ignore: unused_import
import 'package:bloc/bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String appBarTitle = "What do you want to watch?";
  List resultResponse = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    getPopularMovies();
  }
  //! Fetch The Data From API

  Future<void> getPopularMovies() async {
    try {
      var response = await DioHelper.getData(
        endpoint: Strings.discoverEndPoint,
        query: ApiQuery.discoverQuery,
      );
      setState(() {
        resultResponse = (response.data["results"] as List)
            .where((movie) => movie["poster_path"] != null)
            .toList();
      });
    } catch (e) {
      debugPrint("API Error: ${e.toString()}");
    }
  }

  Future<void> search(String keyword) async {
    print("Search input: $keyword");
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      //! to click om any position on the screen to cancel the type focus.
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: AppColors.appTheme,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            appBarTitle,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 22,
              shadows: [
                Shadow(color: AppColors.navCollorTheme, offset: Offset(2, 2)),
              ],
              //! font type
              fontFamily: "Lobster",
            ),
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {});
            currentIndex = value;
            //! switched between the screens by Bottom Navigation Bar
            switch (currentIndex) {
              case 0:
                Navigator.pushNamed(context, "HomeScreen");
                break;
              case 1:
                Navigator.pushNamed(context, "SearchScreen");
                break;
              case 2:
                Navigator.pushNamed(context, "WatchListScreen");
                break;
            }
          },

          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bookmark),
              label: "Watch List",
            ),
          ],
        ),

        //! make the drawer from right not from begin
        endDrawer: Drawer(
          backgroundColor: AppColors.appTheme.withOpacity(0.97),
          child: ListView(
            children: [
              SizedBox(
                height: height * 0.2,
                width: double.infinity,
                child: Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/logo.png"),
                  ),
                ),
              ),
              Gap(10),
              CardDrawerWidget(
                cardIcon: Icon(CupertinoIcons.home, color: Colors.white),
                cardText: "Home Page",
              ),
              CardDrawerWidget(
                cardIcon: Icon(CupertinoIcons.settings, color: Colors.white),
                cardText: "Settings",
              ),
              CardDrawerWidget(
                cardIcon: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                cardText: "Profile ",
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Gap(15),

                const Gap(12),

                if (resultResponse.isNotEmpty)
                  CarouselWidget(resultResponse: resultResponse),
                const Gap(20),
                Expanded(
                  child: DefaultTabController(
                    animationDuration: Duration(milliseconds: 500),

                    initialIndex: 0,

                    length: 4,
                    child: Column(
                      children: [
                        TabBar(
                          textScaler: TextScaler.linear(0.8),

                          labelColor: Colors.white,
                          isScrollable: false,
                          dividerColor: AppColors.textFillTheme,
                          indicatorColor: Colors.white,
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
                              NowplayngTabbar(),
                              UpcomingTabbar(),
                              TopratedTabbar(),
                              PopularTabbar(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

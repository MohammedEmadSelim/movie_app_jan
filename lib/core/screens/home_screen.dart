import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:movie_app/core/constant/constantFiles/api_query.dart';
import 'package:movie_app/core/constant/constantFiles/dio_helpers.dart';
import 'package:movie_app/core/constant/constantFiles/fields.dart';
import 'package:movie_app/core/constant/constantFiles/strings.dart';
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

  @override
  void initState() {
    super.initState();
    getPopularMovies();
  }

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
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            appBarTitle,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: "Lobster",
            ),
          ),
          backgroundColor: AppColors.appTheme,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Gap(15),
                SearchFormField(
                  readOnly: true,
                  hint: "Search",
                  suffixIcon: const Icon(Icons.search_rounded, size: 32),
                  onchanged: (value) => search(value),
                ),
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

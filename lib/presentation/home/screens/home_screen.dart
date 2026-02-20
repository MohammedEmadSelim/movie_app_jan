import 'package:movies_station_app/core/utils/app_colors.dart';
import 'package:movies_station_app/core/utils/app_icons.dart';
import 'package:movies_station_app/presentation/home/tabs/home_tab.dart';
import 'package:movies_station_app/presentation/home/tabs/watch_list_tab.dart';
import 'package:movies_station_app/presentation/home/tabs/search_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static void changeTab(BuildContext context, int index) {
    final state = context.findAncestorStateOfType<_HomeScreenState>();
    state?._changeTab(index);
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _tabs = const [HomeTab(), SearchTab(), WatchListTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _tabs),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.primary,
          border: Border(top: BorderSide(color: AppColors.blue, width: 0.5)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: AppColors.primary,
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.gray,

          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.home,
                colorFilter: ColorFilter.mode(
                  _currentIndex == 0 ? AppColors.blue : AppColors.gray,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.search,
                colorFilter: ColorFilter.mode(
                  _currentIndex == 1 ? AppColors.blue : AppColors.gray,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.bookmark,
                colorFilter: ColorFilter.mode(
                  _currentIndex == 2 ? AppColors.blue : AppColors.gray,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Watchlist',
            ),
          ],
        ),
      ),
    );
  }
}

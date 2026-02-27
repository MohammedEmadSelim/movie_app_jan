import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/app_color.dart';
import 'package:movies/view/screens/home_screen.dart';
import 'package:movies/view/screens/search_screen.dart';
import 'package:movies/view/screens/watch_screen.dart';

class HeartScreen extends StatefulWidget {
  const HeartScreen({super.key});

  @override
  State<HeartScreen> createState() => _HeartScreenState();
}

class _HeartScreenState extends State<HeartScreen> {

  int selectedIndex = 0;
  bool showBottomNav = true;

  final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    WatchScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: showBottomNav
          ? Container(
        height: 90,
        decoration: BoxDecoration(
          border: Border(top:BorderSide(color: AppColor.blue,width: 2), ),
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColor.backGround,
          selectedItemColor: AppColor.textWhite,
          unselectedItemColor:  AppColor.iconHint,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/Home.svg",color: selectedIndex==0?AppColor.textWhite:AppColor.iconHint,),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/Search.svg",color: selectedIndex==1?AppColor.textWhite:AppColor.iconHint,),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/Save.svg",color: selectedIndex==2?AppColor.textWhite:AppColor.iconHint),
              label: "Watch",
            ),
          ],
        ),
      )
          : null,
    );
  }
}

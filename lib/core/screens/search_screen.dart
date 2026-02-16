import 'package:flutter/material.dart';
import 'package:movie_app/core/constant/constantFiles/fields.dart';
import 'package:movie_app/core/theme/app_theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColors.appTheme,
        title: Text("Search", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Gap(20),
            SearchFormField(
              hint: "Search",
              readOnly: false,
              suffixIcon: Icon(Icons.search_rounded),
              onchanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}

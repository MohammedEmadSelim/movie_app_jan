import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/component/noresult.dart';
import 'package:movie_app/screens/home.dart';
import 'package:movie_app/screens/movie_details.dart';

import '../component/custome_text.dart';
import '../core/app_colors.dart';
import '../movies_service/search/search_cubit.dart';
import '../widgets/movie_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColors.primary,
        title: CustomeText(
          text: "Search",
          size: 22,
          weigh: FontWeight.w600,
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (c)=> Home()));
            },
              child: Icon(Icons.arrow_back_ios, color: Colors.white,)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            Gap(35),

            TextFormField(
              controller: controller,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.grey.shade500,
                ),
                filled: true,
                fillColor: Color(0xff3A3F47),
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.grey.shade400),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: AppColors.search),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: AppColors.search),
                ),
              ),
              onFieldSubmitted: (value) {
                searchQuery = value;

                if (value.trim().isNotEmpty) {
                  context.read<SearchCubit>().getValueSearch(query: value);
                }

                setState(() {});
              },
            ),

            Gap(25),

            Expanded(
              child: searchQuery.trim().isEmpty
                  ? NoResultFounded()
                  : BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return Center(child: CircularProgressIndicator(color: Colors.white,));
                  }

                  if (state is SearchFailure) {
                    return NoResultFounded();
                  }

                  if (state is SearchSuccess) {
                    var movies = state.searchProcess.results;

                    if (movies.isEmpty) return NoResultFounded();

                    return ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (c) => MovieDetails(movie: movies[index])));
                          },
                          child: Column(
                            children: [
                              MovieCard(movie: movies[index]),
                              Gap(25),
                            ],
                          ),
                        );
                      },
                    );
                  }

                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }}
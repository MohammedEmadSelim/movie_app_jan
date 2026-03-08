import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/view/widgets/movie_card.dart';
import 'package:movie_app/view_model/search_cubit.dart';

class SearchScreen extends StatefulWidget {
  final String keyword;

  const SearchScreen({super.key, required this.keyword});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.keyword);

    if (widget.keyword.isNotEmpty) {
      context.read<SearchCubit>().search(widget.keyword);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242A32),
      appBar: AppBar(
        backgroundColor: const Color(0xff242A32),
        title: const Text(
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
          // Search Field
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              controller: controller,
              onChanged: (value) {
                if (value.trim().isNotEmpty) {
                  context.read<SearchCubit>().search(value.trim());
                }
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: const Color(0xff3A3F47),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Results Area
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }

                if (state is SearchSuccess) {
                  if (state.searchResponseModel.results.isEmpty) {
                    return Center(
                      child: Lottie.asset(
                        'assets/animations/No Item In Box.json',
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: state.searchResponseModel.results.length,
                    itemBuilder: (context, index) {
                      MovieModel movie = state.searchResponseModel.results[index];

                      // هنا عملنا GestureDetector لكل فيلم
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/details',
                            arguments: movie, // بعثنا الـ MovieModel كله
                          );
                        },
                        child: MovieCard(movie: movie),
                      );
                    },
                  );
                }

                return Center(
                  child: Lottie.asset(
                    'assets/animations/No Item In Box.json',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

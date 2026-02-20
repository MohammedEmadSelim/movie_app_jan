import 'package:movies_station_app/core/constants/app_const.dart';
import 'package:movies_station_app/core/routing/app_routes.dart';
import 'package:movies_station_app/core/shared/shimmer_widgets/home_tab_shimmer_widget.dart';
import 'package:movies_station_app/core/utils/app_colors.dart';
import 'package:movies_station_app/presentation/home/cubit/movies_cubit.dart';
import 'package:movies_station_app/presentation/home/cubit/movies_state.dart';
import 'package:movies_station_app/presentation/home/widgets/custom_tab_text.dart';
import 'package:movies_station_app/presentation/home/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<MoviesCubit>().fetchHomeMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            'What do you want to watch?',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is MoviesError) {
            return Center(child: Text(state.message));
          }

          final isLoading = state is MoviesLoading;

          final nowPlaying = state is MoviesLoaded ? state.nowPlaying : [];

          final upcoming = state is MoviesLoaded ? state.upcoming : [];

          final topRated = state is MoviesLoaded ? state.topRated : [];

          final popular = state is MoviesLoaded ? state.popular : [];

          final currentList = _currentTabIndex == 0
              ? nowPlaying
              : _currentTabIndex == 1
              ? upcoming
              : _currentTabIndex == 2
              ? topRated
              : popular;

          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: CustomTextField()),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: isLoading ? 5 : topRated.length,
                    itemBuilder: (context, index) {
                      final movie = isLoading ? null : topRated[index];

                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: isLoading
                              ? const ShimmerBox(
                                  width: 144,
                                  height: 210,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    AppRoutes.movieDetailsScreen,
                                    arguments: movie,
                                  ),
                                  child: Image.network(
                                    "${AppConstants.imageBaseUrl}${movie!.posterPath}",
                                    width: 144,
                                    height: 210,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 32)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTab("Now playing", 0),
                      _buildTab("Upcoming", 1),
                      _buildTab("Top rated", 2),
                      _buildTab("Popular", 3),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final movie = isLoading ? null : currentList[index];

                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: isLoading
                          ? const ShimmerBox(
                              width: double.infinity,
                              height: double.infinity,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            )
                          : GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.movieDetailsScreen,
                                arguments: movie,
                              ),
                              child: Image.network(
                                "${AppConstants.imageBaseUrl}${movie!.posterPath}",
                                fit: BoxFit.cover,
                              ),
                            ),
                    );
                  }, childCount: isLoading ? 6 : currentList.length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.65,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    return TextButton(
      onPressed: () {
        setState(() {
          _currentTabIndex = index;
        });
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: CustomTabText(text: text, isSelected: _currentTabIndex == index),
    );
  }
}

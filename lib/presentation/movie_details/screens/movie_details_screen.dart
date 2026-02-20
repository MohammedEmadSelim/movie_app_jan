import 'package:movies_station_app/core/constants/app_const.dart';
import 'package:movies_station_app/core/shared/shimmer_widgets/movie_details_shimmer.dart';
import 'package:movies_station_app/core/utils/app_colors.dart';
import 'package:movies_station_app/core/utils/app_icons.dart';
import 'package:movies_station_app/domain/movies/entities/movie_entity.dart';
import 'package:movies_station_app/presentation/home/cubit/watch_list_cubit.dart';
import 'package:movies_station_app/presentation/home/widgets/custom_tab_text.dart';
import 'package:movies_station_app/presentation/movie_details/cubit/movie_details_cubit.dart';
import 'package:movies_station_app/presentation/movie_details/cubit/movie_details_state.dart';
import 'package:movies_station_app/presentation/movie_details/widgets/movie_tabs_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MovieDetailsScreen extends StatefulWidget {
  final MovieEntity movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<MovieDetailsCubit>().fetchMovieDetails(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovieDetailsCubit, MovieDetailsState>(
      listener: (context, state) {
        if (state is MovieDetailsLoaded) {
          final watchListCubit = context.read<WatchListCubit>();
          if (watchListCubit.isInWatchList(state.movieDetails.id)) {
            watchListCubit.updateMovieDetails(
              movieId: state.movieDetails.id,
              genre: state.movieDetails.genres.isNotEmpty
                  ? state.movieDetails.genres.first
                  : null,
              runtime: state.movieDetails.runtime,
            );
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(
              AppIcons.arrowLeft,
              width: 25,
              height: 25,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          title: Text(
            'Detail',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          actions: [
            BlocListener<WatchListCubit, List<MovieEntity>>(
              listener: (context, state) {
                final cubit = context.read<WatchListCubit>();
                final isSaved = cubit.isInWatchList(widget.movie.id);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      isSaved
                          ? "Movie Added to Watchlist"
                          : "Movie Removed from Watchlist",
                    ),
                    duration: const Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: BlocBuilder<WatchListCubit, List<MovieEntity>>(
                builder: (context, watchList) {
                  final cubit = context.read<WatchListCubit>();
                  final isSaved = cubit.isInWatchList(widget.movie.id);

                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: IconButton(
                      onPressed: () {
                        cubit.toggleWatchList(widget.movie);
                      },
                      icon: SvgPicture.asset(
                        isSaved ? AppIcons.bookmarkFilled : AppIcons.bookmark,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return const MovieDetailsShimmer();
            }

            if (state is MovieDetailsError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }

            if (state is MovieDetailsLoaded) {
              final movie = state.movieDetails;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Image.network(
                            "${AppConstants.imageBaseUrl}${movie.backdropPath}",
                            width: double.infinity,
                            height: 260,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: -90,
                          left: 25,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              "${AppConstants.imageBaseUrl}${movie.posterPath}",
                              width: 110,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          right: 16,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.6),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppIcons.star),
                                const SizedBox(width: 4),
                                Text(
                                  movie.voteAverage.toStringAsFixed(1),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.yellow,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(110, 20, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 18),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(70, 35, 16, 16),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.calendar,
                            colorFilter: const ColorFilter.mode(
                              AppColors.darkGray,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            movie.releaseDate.isNotEmpty &&
                                    movie.releaseDate.length >= 4
                                ? movie.releaseDate.substring(0, 4)
                                : '',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkGray,
                            ),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            height: 22,
                            child: VerticalDivider(
                              color: AppColors.darkGray,
                              thickness: 1.3,
                            ),
                          ),
                          const SizedBox(width: 12),
                          SvgPicture.asset(
                            AppIcons.clock,
                            colorFilter: const ColorFilter.mode(
                              AppColors.darkGray,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${movie.runtime} min",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkGray,
                            ),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            height: 22,
                            child: VerticalDivider(
                              color: AppColors.darkGray,
                              thickness: 1.3,
                            ),
                          ),
                          const SizedBox(width: 12),
                          SvgPicture.asset(
                            AppIcons.ticket,
                            colorFilter: const ColorFilter.mode(
                              AppColors.darkGray,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              movie.genres.isNotEmpty ? movie.genres.first : '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkGray,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() => _currentTabIndex = 0);
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: CustomTabText(
                            text: 'About Movie',
                            isSelected: _currentTabIndex == 0,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() => _currentTabIndex = 1);
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: CustomTabText(
                            text: 'Reviews',
                            isSelected: _currentTabIndex == 1,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() => _currentTabIndex = 2);
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: CustomTabText(
                            text: 'Cast',
                            isSelected: _currentTabIndex == 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: MovieTabsContent(
                        currentTabIndex: _currentTabIndex,
                        movieId: widget.movie.id,
                      ),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}

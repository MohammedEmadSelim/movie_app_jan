import 'package:movies_station_app/core/constants/app_const.dart';
import 'package:movies_station_app/core/routing/app_routes.dart';
import 'package:movies_station_app/core/shared/shimmer_widgets/search_shimmer.dart';
import 'package:movies_station_app/core/utils/app_colors.dart';
import 'package:movies_station_app/core/utils/app_icons.dart';
import 'package:movies_station_app/core/utils/app_images.dart';
import 'package:movies_station_app/presentation/home/cubit/search_cubit.dart';
import 'package:movies_station_app/presentation/home/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<SearchCubit>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: AppColors.primary,
            appBar: AppBar(
              backgroundColor: AppColors.primary,
              title: const Text(
                'Search',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    onChanged: (value) {
                      context.read<SearchCubit>().onQueryChanged(value);
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Search movies...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white12,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state is SearchInitial) {
                        final size = MediaQuery.of(context).size;

                        return LayoutBuilder(
                          builder: (context, constraints) {
                            return SingleChildScrollView(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight: constraints.maxHeight,
                                ),
                                child: IntrinsicHeight(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.1,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: size.height * 0.05),

                                        Image.asset(
                                          AppImages.inspect,
                                          width: size.width * 0.35,
                                        ),

                                        SizedBox(height: size.height * 0.03),

                                        Text(
                                          'we are sorry, we can\nnot find the movie :(',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: size.width * 0.045,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.white,
                                          ),
                                        ),

                                        SizedBox(height: size.height * 0.015),

                                        Text(
                                          'Find your movie by type title,\ncategories, years, etc',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: size.width * 0.035,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.gray,
                                          ),
                                        ),

                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }

                      if (state is SearchLoading) {
                        return const SearchShimmer();
                      }

                      if (state is SearchLoaded) {
                        if (state.movies.isEmpty) {
                          return const Center(
                            child: Text(
                              "No movies found",
                              style: TextStyle(color: Colors.white70),
                            ),
                          );
                        }

                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemCount: state.movies.length,
                          itemBuilder: (context, index) {
                            final movie = state.movies[index];

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutes.movieDetailsScreen,
                                        arguments: movie,
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: movie.posterPath.isNotEmpty
                                          ? Image.network(
                                              "${AppConstants.imageBaseUrl}${movie.posterPath}",
                                              width: 90,
                                              height: 120,
                                              fit: BoxFit.cover,
                                              errorBuilder: (_, __, ___) {
                                                return Container(
                                                  width: 90,
                                                  height: 120,
                                                  color: Colors.grey[800],
                                                  child: const Icon(
                                                    Icons.image_not_supported,
                                                    color: Colors.white,
                                                  ),
                                                );
                                              },
                                            )
                                          : Container(
                                              width: 90,
                                              height: 120,
                                              color: Colors.grey[800],
                                              child: const Icon(
                                                Icons.image,
                                                color: Colors.white,
                                              ),
                                            ),
                                    ),
                                  ),

                                  const SizedBox(width: 14),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          movie.title,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),

                                        const SizedBox(height: 8),

                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppIcons.star,
                                              width: 16,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              movie.voteAverage.toStringAsFixed(
                                                1,
                                              ),
                                              style: const TextStyle(
                                                color: Colors.yellow,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),

                                        const SizedBox(height: 8),

                                        if (movie.genre != null &&
                                            movie.genre!.isNotEmpty)
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                AppIcons.ticket,
                                                width: 14,
                                              ),
                                              const SizedBox(width: 6),
                                              Expanded(
                                                child: Text(
                                                  movie.genre!,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                        const SizedBox(height: 8),

                                        if (movie.releaseDate.isNotEmpty &&
                                            movie.releaseDate.length >= 4)
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                AppIcons.calendar,
                                                width: 14,
                                              ),
                                              const SizedBox(width: 6),
                                              Text(
                                                movie.releaseDate.substring(
                                                  0,
                                                  4,
                                                ),
                                                style: const TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),

                                        const SizedBox(height: 8),

                                        if (movie.runtime != null &&
                                            movie.runtime! > 0)
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                AppIcons.clock,
                                                width: 14,
                                              ),
                                              const SizedBox(width: 6),
                                              Text(
                                                "${movie.runtime} min",
                                                style: const TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }

                      if (state is SearchError) {
                        return Center(
                          child: Text(
                            state.message,
                            style: const TextStyle(color: Colors.red),
                          ),
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

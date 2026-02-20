import 'package:movies_station_app/core/constants/app_const.dart';
import 'package:movies_station_app/core/routing/app_routes.dart';
import 'package:movies_station_app/core/shared/shimmer_widgets/watch_list_shimmer_line.dart';
import 'package:movies_station_app/core/utils/app_colors.dart';
import 'package:movies_station_app/core/utils/app_icons.dart';
import 'package:movies_station_app/core/utils/app_images.dart';
import 'package:movies_station_app/domain/movies/entities/movie_entity.dart';
import 'package:movies_station_app/presentation/home/cubit/watch_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Watch List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<WatchListCubit, List<MovieEntity>>(
        builder: (context, watchList) {
          if (watchList.isEmpty) {
            final size = MediaQuery.of(context).size;

            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.box, width: size.width * 0.32),

                    SizedBox(height: size.height * 0.001),

                    Text(
                      'There is no movie yet!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),

                    SizedBox(height: size.height * 0.008),

                    Text(
                      'Find your movie by type title,\ncategories, years, etc',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w500,
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final movie = watchList[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 29,
                      vertical: 8,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRoutes.movieDetailsScreen,
                            arguments: movie,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              "${AppConstants.imageBaseUrl}${movie.posterPath}",
                              width: 95,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.star,
                                    width: 16,
                                    height: 16,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    movie.voteAverage.toStringAsFixed(1),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              movie.genre != null && movie.genre!.isNotEmpty
                                  ? Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppIcons.ticket,
                                          width: 16,
                                          height: 16,
                                        ),
                                        const SizedBox(width: 6),
                                        Expanded(
                                          child: Text(
                                            movie.genre!,
                                            style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.white70,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    )
                                  : const ShimmerLine(width: 110),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.calendar,
                                    width: 16,
                                    height: 16,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    movie.releaseDate.isNotEmpty &&
                                            movie.releaseDate.length >= 4
                                        ? movie.releaseDate.substring(0, 4)
                                        : movie.releaseDate,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              movie.runtime != null && movie.runtime! > 0
                                  ? Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppIcons.clock,
                                          width: 16,
                                          height: 16,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          "${movie.runtime} min",
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    )
                                  : const ShimmerLine(width: 70),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }, childCount: watchList.length),
              ),
            ],
          );
        },
      ),
    );
  }
}

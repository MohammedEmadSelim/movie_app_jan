import 'package:movies_station_app/core/constants/app_const.dart';
import 'package:movies_station_app/core/utils/app_colors.dart';
import 'package:movies_station_app/domain/movie_details/entities/review_entity.dart';
import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  final ReviewEntity review;

  const ReviewItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final avatarPath = review.avatarPath;
    final hasNetworkImage =
        avatarPath != null && avatarPath.toString().startsWith('/');

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 55,
                height: 55,
                child: hasNetworkImage
                    ? Image.network(
                        "${AppConstants.imageBaseUrl}$avatarPath",
                        fit: BoxFit.cover,
                      )
                    : Container(
                        color: Colors.grey.shade800,
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              review.rating?.toStringAsFixed(1) ?? '',
              style: TextStyle(
                color: AppColors.blue,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                review.author ?? '',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                review.content ?? '',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

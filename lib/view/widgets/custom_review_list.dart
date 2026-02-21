import 'package:flutter/material.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/model/review_model.dart';

class ReviewsListView extends StatelessWidget {
  final List<ReviewModel> reviews;

  const ReviewsListView({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: reviews.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final review = reviews[index];
        final author = review.authorDetails;

        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.numberscolor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: author?.avatarPath != null
                        ? NetworkImage("https://image.tmdb.org/t/p/w500${author!.avatarPath}")
                        : const AssetImage('assets/images/no_review_photo.png'),
                  ),
                  const SizedBox(height: 5),
                  if (author?.rating != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 5),
                      child: Text(
                        author!.rating!.toStringAsFixed(1),
                        style: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
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
                      author?.name?.isNotEmpty == true ? author!.name! : review.author ?? 'Unknown',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      review.content ?? '',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.4),
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
}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCarousel extends StatelessWidget {
  const ShimmerCarousel({super.key, required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade800,
            highlightColor: Colors.grey.shade700,
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          );
        },
      ),
    );
    ;
  }
}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetailsShimmer extends StatelessWidget {
  const MovieDetailsShimmer({super.key});

  Widget shimmerBox({double? width, double? height, BorderRadius? radius}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: radius ?? BorderRadius.circular(8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade700,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            shimmerBox(
              width: double.infinity,
              height: 260,
              radius: BorderRadius.zero,
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  shimmerBox(width: 200, height: 20),
                  const SizedBox(height: 16),
                  shimmerBox(width: 150, height: 14),
                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      shimmerBox(width: 80, height: 16),
                      shimmerBox(width: 60, height: 16),
                      shimmerBox(width: 50, height: 16),
                    ],
                  ),

                  const SizedBox(height: 30),

                  shimmerBox(width: double.infinity, height: 14),
                  const SizedBox(height: 10),
                  shimmerBox(width: double.infinity, height: 14),
                  const SizedBox(height: 10),
                  shimmerBox(width: 250, height: 14),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerSkeleton extends StatelessWidget {
  const ShimmerSkeleton({super.key,required this.count});
       final int count;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: count,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
           mainAxisSpacing: 20,
           crossAxisSpacing: 10,
           childAspectRatio: 0.7
        ),
        itemBuilder: (context , index){
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade800,
            highlightColor: Colors.grey.shade700,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          );

        });
  }
}

import 'package:flutter/material.dart' ;

import '../service/service.dart';


class ReviewsSection extends StatelessWidget {
  final int id;
  ReviewsSection({required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: Service().getReviews(id),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
        final reviews = snapshot.data!;
        if (reviews.isEmpty) return const Center(child: Text("No reviews yet", style: TextStyle(color: Colors.white)));

        return ListView.builder(
          itemCount: reviews.length,
          itemBuilder: (context, index) => ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(reviews[index]['author'], style: const TextStyle(color: Colors.white)),
            subtitle: Text(
              reviews[index]['content'],
              style: const TextStyle(color: Colors.grey),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
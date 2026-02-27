import 'package:flutter/material.dart' ;


class ReviewsSection extends StatelessWidget {
  final int id;
  ReviewsSection({required this.id});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(backgroundColor: Colors.grey),
        title: Text("Iqbal Shafiq", style: TextStyle(color: Colors.white)),
        subtitle: Text("From DC Comics comes the Suicide Squad...", style: TextStyle(color: Colors.grey)),
      ),
    );
  }
}
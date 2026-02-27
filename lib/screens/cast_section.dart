import 'package:flutter/material.dart' ;
class CastSection extends StatelessWidget {
  final int id;
  CastSection({required this.id});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: 4,
      itemBuilder: (context, index) => Column(
        children: [
          CircleAvatar(radius: 40, backgroundImage: NetworkImage("URL_HERE")),
          SizedBox(height: 10),
          Text("Tom Holland", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
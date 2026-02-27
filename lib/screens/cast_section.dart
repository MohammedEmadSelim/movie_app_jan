import 'package:flutter/material.dart';
import '../service/api_constants.dart';
import '../service/service.dart';
import '../models/cast_model.dart';

class CastSection extends StatelessWidget {
  final int id;
  CastSection({required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CastModel>>(
      future: Service().getCast(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No cast info", style: TextStyle(color: Colors.white)));
        }
        final list = snapshot.data!;
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: list.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) => Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage("${ApiConstants.imageBaseUrl}${list[index].image}"),
              ),
              const SizedBox(height: 5),
              Text(
                list[index].name,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 12),
                maxLines: 2,
              ),
            ],
          ),
        );
      },
    );
  }
}
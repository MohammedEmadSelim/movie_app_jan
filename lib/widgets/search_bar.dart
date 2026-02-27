import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../cubit/movies_cubit.dart';
class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {

    Timer? timer;
    return TextField(
      onChanged: (text) {
        if (timer?.isActive ?? false) timer?.cancel();
        timer = Timer(const Duration(milliseconds: 500), () {
          if (text.isNotEmpty) {
            context.read<MoviesCubit>().search(text);
          }
        });
      },
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF242C3B),
        hintText: "Search",
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
      ),
    ) ;
  }
}

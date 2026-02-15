import 'package:flutter/material.dart';
class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade700,
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.grey.shade600),


      ),
    );
  }
}

import 'package:movies_station_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTabText extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CustomTabText({super.key, required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected ? AppColors.gray : Colors.transparent,
            width: 2,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: isSelected ? AppColors.white : Colors.grey,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    );
  }
}

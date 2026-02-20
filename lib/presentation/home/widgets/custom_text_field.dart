import 'package:movies_station_app/core/utils/app_colors.dart';
import 'package:movies_station_app/core/utils/app_icons.dart';
import 'package:movies_station_app/presentation/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: () {
          HomeScreen.changeTab(context, 1);
        },

        child: AbsorbPointer(
          child: SizedBox(
            height: 42,
            width: double.infinity,
            child: TextField(
              style: const TextStyle(color: AppColors.white),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                filled: true,
                fillColor: AppColors.gray,
                hintText: 'Search',
                hintStyle: const TextStyle(color: AppColors.grayBlue),
                suffixIconConstraints: const BoxConstraints(
                  minWidth: 32,
                  minHeight: 32,
                ),

                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SvgPicture.asset(
                    AppIcons.searchRight,
                    width: 18,
                    height: 18,
                    fit: BoxFit.contain,
                    colorFilter: const ColorFilter.mode(
                      AppColors.grayBlue,
                      BlendMode.srcIn,
                    ),
                  ),
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

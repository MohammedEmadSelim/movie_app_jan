import 'package:flutter/material.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/view/widgets/custom_text.dart';

class CustomTextFormFieldSearch extends StatelessWidget {
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? controller;

  const CustomTextFormFieldSearch({
    super.key,
    this.controller,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.textColor,
      style: const TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        filled: true,
        fillColor: AppColors.textformfieldbackgroundcolor,
        suffixIcon: const Icon(Icons.search, color: AppColors.hintcolor),
        hint: const CustomText(
          text: "Search",
          color: AppColors.hintcolor,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
      textInputAction: TextInputAction.search,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

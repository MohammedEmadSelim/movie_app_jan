import 'package:flutter/material.dart';
import 'package:movie_app/core/screens/search_screen.dart';
import 'package:movie_app/core/theme/app_theme.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({
    super.key,
    required this.hint,
    required this.suffixIcon,
    required this.onchanged,
    required this.readOnly,
  });
  final String hint;
  final Icon suffixIcon;
  final bool readOnly;

  final ValueChanged<String> onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => SearchScreen()));
      },
      readOnly: readOnly,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      keyboardType: TextInputType.text,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: suffixIcon,
        suffixIconColor: Colors.white,
        filled: true,
        fillColor: AppColors.textFillTheme,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: const Color.fromARGB(255, 73, 53, 52)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}

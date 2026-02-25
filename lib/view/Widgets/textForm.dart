import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/appcolor.dart';


class CustomTextForm extends StatelessWidget {
  const CustomTextForm({super.key , required this.readOnly, this.onTap,this.controller,this.onSubmit});
  final bool readOnly;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final Function(String)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        style: TextStyle(color: AppColors.textWhite),
        cursorColor: AppColors.textWhite,
        decoration: InputDecoration(
            hint: Text('Search',
              style:TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.iconHint) ,),
            filled: true,
            fillColor: AppColors.textField,
            suffixIcon: Transform.rotate(
              angle: 1.6,
              child: SvgPicture.asset("assets/icons/Search.svg",fit:BoxFit.scaleDown,),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            )
        ),
        onTap: onTap,
        onFieldSubmitted:onSubmit
        ,
      ),
    );
  }
}
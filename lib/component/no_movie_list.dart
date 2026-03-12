import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/component/custome_text.dart';

class NoMovieList extends StatelessWidget {
  const NoMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Gap(230),
              Image.asset("assets/images/magic-box 1.png", width: 120, height: 120,),
              Gap(18),
            CustomeText(text: "There is no movie yet!",size: 18,weigh: FontWeight.w600,),
            Gap(8),
            CustomeText(text: "Find your movie by Type title,",size: 14,weigh: FontWeight.w500,color: Color(0xff92929D),),
            Gap(3),
            CustomeText(text: "categories, years, etc ",size: 14,weigh: FontWeight.w500,color: Color(0xff92929D),),
          ],
        ),
      ],
    );
  }
}

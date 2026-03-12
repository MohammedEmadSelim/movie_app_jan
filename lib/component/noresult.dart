import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../core/app_colors.dart';
import 'custome_text.dart';

class NoResultFounded extends StatelessWidget {
  const NoResultFounded({super.key});

  @override
  Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Gap(195),
            SvgPicture.asset(
              "assets/images/no-results 1.svg",
              width: 86,
              height: 86,
            ),
            Gap(16),
            CustomeText(text: "we are sorry, we can ", size: 18, weigh: FontWeight.w600),
            Gap(2),
            CustomeText(text: "not find the movie :(", size: 18, weigh: FontWeight.w600),
            Gap(8),
            CustomeText(
              text: "Find your movie by Type title,",
              size: 14,
              weigh: FontWeight.w500,
              color: AppColors.search,
            ),
            Gap(2),
            CustomeText(
              text: " categories, years, etc",
              size: 14,
              weigh: FontWeight.w500,
              color: AppColors.search,
            ),
          ],
        ),
      );

  }
}

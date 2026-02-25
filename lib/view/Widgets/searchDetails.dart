import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/appcolor.dart';


class CustomDetailsCoulmn extends StatelessWidget {
  const CustomDetailsCoulmn({
    super.key,
    required this.movieName,
    required this.movieRate,
    required this.movieType,
    required this.movieYear,
    required this.movieTime,
  });

  final String movieName;
  final double movieRate;
  final String movieType;
  final String movieYear;
  final String movieTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            movieName,
            softWrap: true,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textWhite,
            ),
          ),
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/icons/Star.svg"),
              SizedBox(width: 4),
              Text(
                movieRate.toString(),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textWhite,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/Ticket.svg",
                color: AppColors.textWhite,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  movieType.toString(),
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textWhite,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/CalendarBlank.svg",
                color: AppColors.textWhite,
              ),
              SizedBox(width: 8),
              Text(
                (movieYear != null && movieYear.length >= 4) ? movieYear.substring(0, 4) : "Unknown",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textWhite,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/Clock.svg",
                color: AppColors.textWhite,
              ),
              SizedBox(width: 8),
              Text(
                '$movieTime minutes',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textWhite,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
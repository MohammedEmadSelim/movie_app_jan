import 'package:flutter/material.dart';
import 'package:movies/core/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MovieNameTitle extends StatelessWidget {
  const MovieNameTitle({super.key,required this.movieName, required this.movieYear, required this.movieTime, required this.movieType});

  final String movieName;
  final String movieYear;
  final String  movieTime;
  final String movieType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20,bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 160),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                movieName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColor.textWhite,
                ),
              ),
            ),
          ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/CalendarBlank.png",height: 20,),
              Text(movieYear,style: TextStyle(fontSize: 12,fontWeight:FontWeight.w500 ,color: AppColor.detail,letterSpacing: 0.12)),
              SizedBox(
                  height: 20,
                  width: 30,
                  child: VerticalDivider(color: AppColor.iconHint,thickness: 2,)),
              Image.asset("assets/Clock.png",height: 20),
              Text("$movieTime minutes",style: TextStyle(fontSize: 12,fontWeight:FontWeight.w500 ,color: AppColor.detail,letterSpacing: 0.12)),
              SizedBox(
                  height: 20,
                  width: 40,
                  child: VerticalDivider(color: AppColor.iconHint,thickness: 2,)),
              Image.asset("assets/Ticket.png",height: 20,),
              Text(movieType,style: TextStyle(fontSize: 12,fontWeight:FontWeight.w500 ,color: AppColor.detail,letterSpacing: 0.12)),
            ],
          )
        ],
      ),
    );
  }
}
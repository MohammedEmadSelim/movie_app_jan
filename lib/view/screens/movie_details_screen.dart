 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show AppBar, Scaffold, Colors;
import 'package:movie_app/models/movie_model.dart';

class MovieDetailsScreen  extends StatefulWidget{

const MovieDetailsScreen({super.key,required this.movie});
final MovieModel movie;
  @override State createState() => _MovieDetailsScreenState();
}
 class _MovieDetailsScreenState extends State {
  @override Widget build(BuildContext context) {
    var screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        backgroundColor: Color(0xff242A32),
        appBar: AppBar(backgroundColor: Color(0xff242A32),
            centerTitle: true,
            title: Text("Details",
              style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            )));
  }}
import 'package:flutter/material.dart';
import 'package:food_ui_app/constants.dart';
import 'package:food_ui_app/page/HomePage/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food App",
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            body1: TextStyle(color: ksecondaryColor),
            body2: TextStyle(color: ksecondaryColor)
          )
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
    );
  }
}
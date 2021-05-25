import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ui_app/constants.dart';
import 'package:food_ui_app/page/DetailsPage/DetailsScreen.dart';

import 'HomeBody.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 35),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, -7),
                  color: Color(0xFF6DAED9).withOpacity(0.11),
                  blurRadius: 33)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: SvgPicture.asset("icons/home.svg"), onPressed: () {}),
            IconButton(
                icon: SvgPicture.asset("icons/Following.svg"),
                onPressed: () {}),
            IconButton(
                icon: SvgPicture.asset("icons/Glyph.svg"), onPressed: () {}),
            IconButton(
                icon: SvgPicture.asset("icons/person.svg"), onPressed: () {}),
          ],
        ),
      ),
      body: HomeBody(),
    );
  }

  AppBar myAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          icon: SvgPicture.asset("icons/menu.svg"), onPressed: () {}),
      title: RichText(
          text: TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.bold),
              children: [
            TextSpan(text: "Punk", style: TextStyle(color: kPrimaryColor)),
            TextSpan(text: "Food", style: TextStyle(color: ksecondaryColor))
          ])),
      centerTitle: true,
      actions: [
        IconButton(
            icon: SvgPicture.asset("icons/notification.svg"), onPressed: () {})
      ],
    );
  }
}

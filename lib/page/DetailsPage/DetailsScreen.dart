import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ui_app/constants.dart';
import 'package:food_ui_app/page/DetailsPage/DetailsBody.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailsAppBar(context: context),
      body: DetailsBody(),
    );
  }

  AppBar detailsAppBar({BuildContext context}) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.maybePop(context);
          // Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(icon: SvgPicture.asset("icons/share.svg"), onPressed: () {}),
        IconButton(icon: SvgPicture.asset("icons/more.svg"), onPressed: () {})
      ],
    );
  }
}

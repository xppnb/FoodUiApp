import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ui_app/constants.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        ItemImage(
          imgSrc: "images/burger.png",
        ),
        ItemInfo()
      ],
    );
  }
}

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Column(
          children: [
            shopeName(name: "MacDonalds"),
            TitlePriceRating(
              rating: 4,
              name: "Cheese Burger",
              price: 15,
              numOfReviews: 24,
              ratingChangeCallback: (value) {
                print(value.toString());
              },
            ),
            Text(
                "Nowadays, making printed materials have become fast, easy and simple. If you want your promotional material to be an eye-catching object, you should make it colored. By way of using inkjet printer this is not hard to make. An inkjet printer is any printer that places extremely small droplets of ink onto paper to create an image.",
                style: TextStyle(
                  height: 1.5,
                )),
            SizedBox(
              height: size.height * 0.1,
            ),
            OrderButton()
          ],
        ),
      ),
    );
  }

  Row shopeName({String name}) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: ksecondaryColor,
        ),
        SizedBox(
          width: 10,
        ),
        Text(name),
      ],
    );
  }
}

class OrderButton extends StatelessWidget {
  const OrderButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("icons/bag.svg"),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Order Now",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TitlePriceRating extends StatelessWidget {
  final int price, numOfReviews;
  final double rating;
  final String name;
  final RatingChangeCallback ratingChangeCallback;

  const TitlePriceRating({
    Key key,
    this.price,
    this.numOfReviews,
    this.rating,
    this.name,
    this.ratingChangeCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SmoothStarRating(
                      onRated: this.ratingChangeCallback,
                      borderColor: kPrimaryColor,
                      rating: rating,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("$numOfReviews reviews"),
                  ],
                ),
              ],
            ),
          ),
          ClipPath(
            clipper: PricerCliper(),
            child: Container(
              height: 66,
              width: 65,
              padding: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.topCenter,
              color: kPrimaryColor,
              child: Text(
                "\$$price",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PricerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    var reducePath = 20;
    path.lineTo(0, size.height - reducePath);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - reducePath);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class ItemImage extends StatelessWidget {
  final String imgSrc;

  const ItemImage({
    Key key,
    this.imgSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Image.asset(
      imgSrc,
      height: size.height * 0.25,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

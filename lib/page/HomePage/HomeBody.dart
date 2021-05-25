import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ui_app/constants.dart';
import 'package:food_ui_app/page/DetailsPage/DetailsScreen.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBox(
            onChanged: (value) {
              print(value);
            },
          ),
          CategoryList(),
          ItemList(),
          DiscountCard()
        ],
      ),
    );
  }
}

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "offers & Discounts",
            style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            height: 166,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage("images/beyond-meat-mcdonalds.png"),
                    fit: BoxFit.fill)),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [
                  Color(0xFFFF961F).withOpacity(0.7),
                  kPrimaryColor.withOpacity(.7),
                ]),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: SvgPicture.asset("icons/macdonalds.svg"),
                    ),
                    Expanded(
                        child: RichText(
                            text: TextSpan(children: [
                      TextSpan(
                        text: "Get Discount of\n",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextSpan(
                          text: "30%\n",
                          style: TextStyle(
                              fontSize: 43, fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "at Macdonald's on your first order & Instant cashback",
                          style: TextStyle(fontSize: 16)),
                    ])))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ItemCard(
            svgSrc: "icons/burger_beer.svg",
            title: "Burger & Beer",
            shopName: "MacDonald's",
            press: () {
              NavigatorUtils(context: context, page: DetailsPage());
            },
          ),
          ItemCard(
            svgSrc: "icons/chinese_noodles.svg",
            title: "Chinese & Noodles",
            shopName: "Wendys",
            press: () {
              NavigatorUtils(context: context, page: DetailsPage());
            },
          ),
          ItemCard(
            svgSrc: "icons/burger_beer.svg",
            title: "Burger & Beer",
            shopName: "MacDonald's",
            press: () {
              NavigatorUtils(context: context, page: DetailsPage());
            },
          ),
          ItemCard(
            svgSrc: "icons/chinese_noodles.svg",
            title: "Chinese & Noodles",
            shopName: "Wendys",
            press: () {
              NavigatorUtils(context: context, page: DetailsPage());
            },
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final String shopName;
  final Function press;

  const ItemCard({
    Key key,
    this.svgSrc,
    this.title,
    this.press,
    this.shopName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.32,
      margin: EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 40,
              color: Color(0xFFB0CCE1).withOpacity(0.32),
            )
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(25),
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColor.withOpacity(0.13),
                  ),
                  child: SvgPicture.asset(
                    svgSrc,
                    width: size.width * 0.18,
                    height: size.height * 0.1,
                  ),
                ),
                Text(title),
                SizedBox(
                  height: 10,
                ),
                Text(
                  shopName,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryItem(
            title: "Combo Meal",
            press: () {},
            isAction: true,
          ),
          CategoryItem(
            title: "Chicken",
            press: () {},
          ),
          CategoryItem(
            title: "Beverages",
            press: () {},
          ),
          CategoryItem(
            title: "Snacks & Sides",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final Function press;
  final bool isAction;

  const CategoryItem({
    Key key,
    this.title,
    this.press,
    this.isAction = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Text(
              title,
              style: isAction
                  ? TextStyle(color: kTextColor, fontWeight: FontWeight.bold)
                  : TextStyle(fontSize: 13),
            ),
            if (isAction)
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 3,
                width: 22,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
          ],
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchBox({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(color: ksecondaryColor.withOpacity(0.32)),
          borderRadius: BorderRadius.circular(50)),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: SvgPicture.asset("icons/search.svg"),
            hintText: "   Search Here",
            hintStyle: TextStyle(color: ksecondaryColor)),
      ),
    );
  }
}

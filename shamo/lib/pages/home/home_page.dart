import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/product_card.dart';
import 'package:shamo/widgets/product_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
          margin: EdgeInsets.only(
            top: defaultMargin,
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hallo, Rydwan",
                      style: primaryTextStyle.copyWith(
                          fontSize: 24, fontWeight: semibold),
                    ),
                    Text("@rydwan_10",
                        style: subtitleTextStyle.copyWith(fontSize: 16))
                  ],
                ),
              ),
              Container(
                width: 54,
                height: 54,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/image_profile.png"),
                  ),
                ),
              )
            ],
          ));
    }

    Widget categories() {
      return Container(
          margin: EdgeInsets.only(top: defaultMargin),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: defaultMargin,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: primaryColor,
                  ),
                  child: Text(
                    "All Shoes",
                    style: primaryTextStyle.copyWith(
                        fontSize: 13, fontWeight: medium),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: subtitleColor),
                    color: transparentColor,
                  ),
                  child: Text(
                    "Running",
                    style: subtitleTextStyle.copyWith(
                        fontSize: 13, fontWeight: medium),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: subtitleColor),
                    color: transparentColor,
                  ),
                  child: Text(
                    "Training",
                    style: subtitleTextStyle.copyWith(
                        fontSize: 13, fontWeight: medium),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: subtitleColor),
                    color: transparentColor,
                  ),
                  child: Text(
                    "Basket Ball",
                    style: subtitleTextStyle.copyWith(
                        fontSize: 13, fontWeight: medium),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: subtitleColor),
                    color: transparentColor,
                  ),
                  child: Text(
                    "Hiking",
                    style: subtitleTextStyle.copyWith(
                        fontSize: 13, fontWeight: medium),
                  ),
                ),
              ],
            ),
          ));
    }

    Widget popularProductsTitle() {
      return Container(
          margin: EdgeInsets.only(
              top: defaultMargin, right: defaultMargin, left: defaultMargin),
          child: Text(
            "Popular Products",
            style:
                primaryTextStyle.copyWith(fontSize: 22, fontWeight: semibold),
          ));
    }

    Widget popularProducts() {
      return Container(
        margin: const EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(children: [
                ProductCard(),
                ProductCard(),
                ProductCard(),
              ])
            ],
          ),
        ),
      );
    }

    Widget newArrivalsTitle() {
      return Container(
          margin: EdgeInsets.only(
              top: defaultMargin, right: defaultMargin, left: defaultMargin),
          child: Text(
            "New Arrivals",
            style:
                primaryTextStyle.copyWith(fontSize: 22, fontWeight: semibold),
          ));
    }

    Widget newArrivals() {
      return Container(
        margin: const EdgeInsets.only(top: 14),
        child: Column(
          children: [
            ProductTile(),
            ProductTile(),
            ProductTile(),
            ProductTile(),
          ],
        ),
      );
    }

    return Center(
      child: ListView(
        children: [
          header(),
          categories(),
          popularProductsTitle(),
          popularProducts(),
          newArrivalsTitle(),
          newArrivals()
        ],
      ),
    );
  }
}

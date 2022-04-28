import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/product_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/product_card.dart';
import 'package:shamo/widgets/product_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    UserModel user = authProvider.user;

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
                      "Hallo, ${user.name}",
                      style: primaryTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semibold,
                      ),
                    ),
                    Text(
                      "@${user.username}",
                      style: subtitleTextStyle.copyWith(fontSize: 16),
                    )
                  ],
                ),
              ),
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://scontent.fcgk10-1.fna.fbcdn.net/v/t39.30808-1/279132916_3182820888621748_3917656638179521425_n.jpg?stp=dst-jpg_p160x160&_nc_cat=105&ccb=1-5&_nc_sid=7206a8&_nc_eui2=AeF6ReIaak7PqVhIZ8_WDurzvhrSWeMQRru-GtJZ4xBGu7AWdKL6qziGSQdBL_4OZkEEawFm0Y6UQlKi-XKtnV0m&_nc_ohc=Lpafh2LOgGoAX95gKnz&_nc_ht=scontent.fcgk10-1.fna&oh=00_AT8L_Pw2XzqJ1ffXEdOj1GCNNUMdf13A9ig1Cus-UpgBHg&oe=626BEE06"),
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
              Row(
                children: productProvider.products
                    .map((product) => ProductCard(
                          product: product,
                        ))
                    .toList(),
              )
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
          children: productProvider.products
              .map((product) => ProductTile(
                    product: product,
                  ))
              .toList(),
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

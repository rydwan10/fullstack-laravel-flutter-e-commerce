import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        title: Text("Your Cart"),
        centerTitle: true,
        elevation: 0,
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icon_empty_cart.png", 
              width: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Opss! Your Cart is Empty",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Let's find your favorite shoes",
              style: secondaryTextStyle,
            ),
            Container(
              width: 154,
              height: 44,
              margin: const EdgeInsets.only(top: 20),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
                },
                child: Text(
                  "Explore Store",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12,),
                  ),
                ),
              ),
            ),
          ]
        ),
      );
    }
    
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70), 
        child: header(),
      ),
      body: emptyCart(),
    );
  }
}
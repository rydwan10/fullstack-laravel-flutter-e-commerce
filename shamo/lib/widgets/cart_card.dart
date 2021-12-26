import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CartCard extends StatelessWidget {
  CartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage("assets/image_shoes.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Terrex Urban Low lorem ipsum dolor sit amet set dela rosta",
                      style: primaryTextStyle.copyWith(
                        fontWeight: semibold,
                      ),
                    ),
                    Text(
                      "\$143,98",
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Column(
                children: [
                  Image.asset(
                    "assets/button_add.png",
                    width: 16,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "2",
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Image.asset(
                    "assets/button_min.png",
                    width: 16,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Image.asset(
                "assets/icon_delete.png",
                width: 10,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                "Remove",
                style: alertTextStyle.copyWith(
                  fontWeight: light,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

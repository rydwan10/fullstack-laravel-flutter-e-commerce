import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class WishList extends StatelessWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("WishList", style: primaryTextStyle),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Widget header() {
    return AppBar(
      backgroundColor: backgroundColor1,
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  "assets/image_profile.png",
                  width: 64,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hallo, Rydwan",
                      style: primaryTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semibold,
                      ),
                    ),
                    Text(
                      "@rydwan10",
                      style: subtitleTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              Image.asset(
                "assets/button_exit.png",
                width: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget menuItem({String text = ""}) {
    return Container(
      height: 30,
      margin: const EdgeInsets.only(
        top: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: secondaryTextStyle.copyWith(
              fontSize: 15,
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: primaryTextColor,
          )
        ],
      ),
    );
  }

  Widget content() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Account",
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semibold,
              ),
            ),
            menuItem(
              text: "Edit Profile",
            ),
            menuItem(
              text: "Your Orders",
            ),
            menuItem(
              text: "Help",
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "General",
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semibold,
              ),
            ),
            menuItem(
              text: "Privacy & Policy",
            ),
            menuItem(
              text: "Term of Service",
            ),
            menuItem(
              text: "Rate App",
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}

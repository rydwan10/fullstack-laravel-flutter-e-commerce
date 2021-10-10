import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shamo/theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;

  void _toggleShowPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign Up",
                style: primaryTextStyle.copyWith(
                    fontSize: 24, fontWeight: semibold),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                "Register and Happy Shopping",
                style: subtitleTextStyle,
              )
            ],
          ));
    }

    Widget fullNameInput() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Full Name",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icon_name.png",
                    width: 17,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: TextFormField(
                    style: primaryTextStyle,
                    decoration: InputDecoration.collapsed(
                        hintText: "Your Full Name",
                        hintStyle: subtitleTextStyle),
                  ))
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget username() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Username",
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(children: [
              Image.asset(
                "assets/icon_username.png",
                width: 17,
              ),
              const SizedBox(width: 12),
              Expanded(
                  child: TextFormField(
                style: primaryTextStyle,
                decoration: InputDecoration.collapsed(
                    hintText: "Username", hintStyle: subtitleTextStyle),
              ))
            ]),
          )
        ]),
      );
    }

    Widget emailInput() {
      return Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email Address",
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(height: 12),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(children: [
                  Image.asset(
                    "assets/icon_email.png",
                    width: 17,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                          hintText: "Your Email Address",
                          hintStyle: subtitleTextStyle),
                    ),
                  )
                ]),
              )
            ],
          ));
    }

    Widget passwordInput() {
      return Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Password",
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(height: 12),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: backgroundColor2,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(children: [
                  Image.asset(
                    "assets/icon_password.png",
                    width: 17,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      obscureText: _obscureText,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: "Your Password",
                        hintStyle: subtitleTextStyle,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        _toggleShowPassword();
                      },
                      child: Text(
                        _obscureText == true ? "Show" : "Hide",
                        style: GoogleFonts.poppins(color: priceColor),
                      ))
                ]),
              )
            ],
          ));
    }

    Widget signInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/home");
          },
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Text(
            "Sign Up",
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Already have an account? ",
            style: subtitleTextStyle.copyWith(fontSize: 12),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/sign-in");
            },
            child: Text(
              "Sign In",
              style: purpleTextStyle.copyWith(fontSize: 12, fontWeight: medium),
            ),
          )
        ]),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                fullNameInput(),
                username(),
                emailInput(),
                passwordInput(),
                signInButton(),
                const Spacer(),
                footer()
              ],
            )),
      ),
    );
  }
}

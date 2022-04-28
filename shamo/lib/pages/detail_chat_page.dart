import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/message_model.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/services/message_service.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/chat_bubble.dart';

class DetailChatPage extends StatefulWidget {
  ProductModel product;

  DetailChatPage({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  TextEditingController messageController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleAddMessage() async {
      await MessageService().addMessages(
          user: authProvider.user,
          isFromUser: true,
          message: messageController.text,
          product: widget.product);

      setState(() {
        widget.product = UninitializeProductModel();
        messageController.text = '';
      });
    }

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        title: Row(
          children: [
            Image.asset(
              "assets/image_shop_logo_online.png",
              width: 50,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shoe Store",
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Online",
                  style: secondaryTextStyle.copyWith(
                    fontWeight: light,
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ],
        ),
        centerTitle: false,
      );
    }

    Widget productPreview() {
      return Container(
        width: 225,
        height: 74,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: backgroundColor5,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: primaryColor,
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.product.galleries![0].url,
                width: 54,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.product.name,
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "\$${widget.product.price}",
                    style: priceTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.product = UninitializeProductModel();
                });
              },
              child: Image.asset(
                "assets/button_close.png",
                width: 22,
              ),
            )
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.product is UninitializeProductModel
                ? const SizedBox()
                : productPreview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor4,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: messageController,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: "Type Message . . .",
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    handleAddMessage();
                  },
                  child: Image.asset(
                    "assets/button_send.png",
                    width: 45,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream: MessageService()
              .getMessagesByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {
            //log(snapshot.hasData.toString());
            if (snapshot.hasError) {
              // log(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              return ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                children: snapshot.data
                        ?.map((MessageModel message) => ChatBubble(
                              isSender: message.isFromUser,
                              text: message.message,
                              product: message.product,
                            ))
                        .toList() ??
                    [const Text("no messages")],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          });
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: PreferredSize(
        child: header(),
        preferredSize: const Size.fromHeight(70),
      ),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}

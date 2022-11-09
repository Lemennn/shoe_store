// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/message_model.dart';
import 'package:store/pages/home/widget/detail_chat.dart';
import 'package:store/providers/auth_provider.dart';
import 'package:store/services/message_service.dart';
import 'package:store/theme.dart';

import '../../models/product_models.dart';

class detailChat extends StatefulWidget {
  ProductModel product;
  detailChat(this.product);

  @override
  State<detailChat> createState() => _detailChatState();
}

class _detailChatState extends State<detailChat> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    Widget previewItem() {
      return Container(
        height: 74,
        width: 225,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor5,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: primaryColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                '${widget.product.galleries![0].url}',
                height: 54,
                width: 54,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.product.name}',
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '\$${widget.product.price}',
                    style: priceTextStyle.copyWith(fontWeight: medium),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.product = UninitializedProductModel();
                });
              },
              child: Image.asset(
                'assets/preview_close.png',
                height: 22,
                width: 22,
              ),
            ),
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.product is UninitializedProductModel
                ? SizedBox()
                : previewItem(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
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
                            hintText: 'Typle Message...',
                            hintStyle: subTextStyle.copyWith()),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    MessageService().messages(
                      user: authProvider.user,
                      product :  widget.product == {} ? UninitializedProductModel() : widget.product,
                      isFromUser :  true,
                      message : messageController.text,
                    );
                    setState(() {
                      widget.product = UninitializedProductModel();
                      messageController.text = '';
                    });
                  },
                  child: Image.asset(
                    'assets/send.png',
                    width: 45,
                    height: 45,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget chatmain() {
      return StreamBuilder<List<MessageModel>>(
          stream: MessageService()
              .getMessageFromUserId(userId: authProvider.user!.id),
          builder: (context,snapshot) {
            if (snapshot.hasData) {
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                children: snapshot.data!
                    .map((MessageModel message) => chatBubble(
                          isichat: message.message,
                          isUser: message.isFromUser,
                          product: message.product,
                        ))
                    .toList(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: backgroundColor1,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                'assets/chat_picture.png',
                height: 50,
                width: 50,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Online',
                    style:
                        subTextStyle.copyWith(fontWeight: light, fontSize: 14),
                  ),
                ],
              )
            ],
          ),
        ),
        preferredSize: const Size.fromHeight(70),
      ),
      bottomNavigationBar: chatInput(),
      body: chatmain(),
    );
  }
}

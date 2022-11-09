import 'package:flutter/material.dart';
import 'package:store/models/message_model.dart';
import 'package:store/models/product_models.dart';
import 'package:store/pages/home/detail_chat_page.dart';
import 'package:store/theme.dart';

class chatTile extends StatelessWidget {
  final MessageModel? message;
  const chatTile(this.message);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => detailChat(
              UninitializedProductModel(),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 33),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/splash.png',
                  height: 54,
                  width: 54,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shoe Store',
                        style: primaryTextStyle.copyWith(
                            fontSize: 15, fontWeight: regular),
                      ),
                      Text(
                        '${message?.message}',
                        style: subTextStyle.copyWith(
                            fontWeight: light, fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Now',
                  style: secondaryTextStyle.copyWith(
                      fontSize: 10, fontWeight: regular),
                ),
              ],
            ),
            SizedBox(
              height: 17,
            ),
            Divider(
              color: primaryColor,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}

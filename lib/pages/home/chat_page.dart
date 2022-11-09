import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product_models.dart';
import 'package:store/providers/auth_provider.dart';
import 'package:store/services/message_service.dart';
import 'package:store/theme.dart';
import 'widget/chat_tile.dart';

class chatPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
     Widget header() {
    return Container(
      child: AppBar(
        centerTitle: true,
        title: Text('Message Support'),
        backgroundColor: backgroundColor1,
        titleTextStyle: primaryTextStyle.copyWith(
          fontSize: 18,
          fontWeight: medium,
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
    );
  }

  Widget chatEmpty() {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: backgroundColor3,
        // height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_headset.png',
              height: 80,
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Opss no message yet?',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'You have never done a transaction',
              style: secondaryTextStyle,
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 24,
                ),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget availabelChat() {
    return StreamBuilder<Object>(
      stream: MessageService().getMessageFromUserId(userId : authProvider.user!.id),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData){
          if (snapshot.data.length == 0){
            return chatEmpty();
          }
          return Expanded(
            child: Container(
              width: double.infinity,
              color: backgroundColor3,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                children: [
                  chatTile(snapshot.data[snapshot.data!.length - 1]),
                ],
              ),
            ),
          );
        }else{
          return chatEmpty();
        }
      }
    );
  }

    return Column(
      children: [header(), availabelChat()],
    );
  }
}

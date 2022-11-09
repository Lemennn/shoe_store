import 'package:flutter/material.dart';
import 'package:store/pages/home/chat_page.dart';
import 'package:store/pages/home/home_page.dart';
import 'package:store/pages/home/profile_page.dart';
import 'package:store/pages/home/wishlist_page.dart';
import 'package:store/providers/auth_provider.dart';
import 'package:store/theme.dart';

class pageMain extends StatefulWidget {
  const pageMain({super.key});

  @override
  State<pageMain> createState() => _pageMainState();
}

class _pageMainState extends State<pageMain> {

  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
   
    Widget chartbutton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/button_chart.png',
          width: 20,
          height: 22,
        ),
      );
    }

    Widget customNavBar() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            currentIndex: currentindex,
            onTap: (value) {
              print(value);
              setState(() {
                currentindex = value;
              });
            },
            backgroundColor: backgroundColor4,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_home.png',
                    width: 22,
                    color: currentindex == 0 ? primaryColor : Color(0xff808191),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_chat.png',
                    width: 20,
                    color: currentindex == 1 ? primaryColor : Color(0xff808191),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_wishlist.png',
                    width: 20,
                    color: currentindex == 2 ? primaryColor : Color(0xff808191),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    'assets/icon_profile2.png',
                    width: 20,
                    color: currentindex == 3 ? primaryColor : Color(0xff808191),
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }
    Widget body(){
      switch (currentindex) {
        case 0:
            return homepage();
          break;
        case 1:
            return chatPage();
          break;
        case 2:
            return wishlistPage();
          break;
        case 3:
            return profilePage();
          break;
        default:
          return homepage();
      }
    }

    return Scaffold(
      backgroundColor: currentindex == 0 ? backgroundColor1 : backgroundColor3,
      floatingActionButton: chartbutton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customNavBar(),
      body: body()
    );
  }
}
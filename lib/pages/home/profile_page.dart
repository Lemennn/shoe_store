import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/user_models.dart';
import 'package:store/providers/auth_provider.dart';
import 'package:store/theme.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel? user = authProvider.user;
    Widget header() {
    return AppBar(
      backgroundColor: backgroundColor1,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Row(
            children: [
              ClipOval(
                child: Image.network(
                  '${user?.profilePhotoUrl}',
                  height: 64,
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
                      'Hallo, ${user?.name}',
                      style: primaryTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semibold,
                      ),
                    ),
                    Text(
                      '@${user?.username}',
                      style: subTextStyle.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/sign-in',
                    (route) => false,
                  );
                },
                child: Image.asset(
                  'assets/button_exit.png',
                  height: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menubar(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: fourTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
          ),
          Image.asset(
            'assets/icon_nextProfile.png',
            width: 12,
            height: 6,
            color: fourTextColor,
          ),
        ],
      ),
    );
  }

  Widget action() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/edit_profile');
              },
              child: menubar('Edit Profile'),
            ),
            menubar('Your Orders'),
            menubar('Help'),
            const SizedBox(
              height: 10,
            ),
            Text(
              'General',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
            ),
            const SizedBox(
              height: 16,
            ),
            menubar('Privacy & Policy'),
            menubar('Term of Service'),
            menubar('Rate App'),
          ],
        ),
      ),
    );
  }
    return Column(
      children: [
        header(),
        action(),
      ],
    );
  }
}

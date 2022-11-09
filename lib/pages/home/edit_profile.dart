import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/user_models.dart';
import 'package:store/providers/auth_provider.dart';
import 'package:store/theme.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel? user = authProvider.user;
    Widget nameInput() {
      return Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                DefaultTextStyle(
                  style: fourTextStyle.copyWith(fontSize: 13),
                  child: const Text(
                    'Name',
                  ),
                ),
              ],
            ),
            TextFormField(
              style: primaryTextStyle.copyWith(fontSize: 16),
              decoration: InputDecoration(
                hintText: user?.name,
                hintStyle: primaryTextStyle.copyWith(
                  fontSize: 16,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: subTextColor),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                DefaultTextStyle(
                  style: fourTextStyle.copyWith(fontSize: 13),
                  child: const Text(
                    'Username',
                  ),
                ),
              ],
            ),
            TextFormField(
              style: primaryTextStyle.copyWith(fontSize: 16),
              decoration: InputDecoration(
                hintText: '@${user?.username}',
                hintStyle: primaryTextStyle.copyWith(
                  fontSize: 16,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: subTextColor),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                DefaultTextStyle(
                  style: fourTextStyle.copyWith(fontSize: 13),
                  child: const Text(
                    'Email Adress',
                  ),
                ),
              ],
            ),
            TextFormField(
              style: primaryTextStyle.copyWith(fontSize: 16),
              decoration: InputDecoration(
                hintText: user?.email,
                hintStyle: primaryTextStyle.copyWith(
                  fontSize: 16,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: subTextColor),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inti() {
      return Container(
        width: double.infinity,
        color: backgroundColor3,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            ClipOval(
              child: Image.network(
                '${user?.profilePhotoUrl}',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            nameInput(),
            usernameInput(),
            emailInput(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor1,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
            )),
        title: Text(
          'Edit Profile',
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: ListView(children: [inti()]),
      resizeToAvoidBottomInset: false,
    );
  }
}

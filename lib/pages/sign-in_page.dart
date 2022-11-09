import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/pages/home/widget/loading.dart';
import 'package:store/providers/auth_provider.dart';
import 'package:store/theme.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    login() async {
      setState(() {
        isloading = true;
      });
      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Login Gagal',
              textAlign: TextAlign.center,
            ),
          ),
        );
      };
      setState(() {
        isloading = false;
      });
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semibold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Sign in to Continue',
              style: subTextStyle,
            )
          ],
        ),
      );
    }

    Widget inputemail() {
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email Address',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                )),
            SizedBox(height: 12),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_email.png',
                      width: 17,
                      height: 12,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                        child: TextFormField(
                      controller: emailController,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Your Email Address',
                        hintStyle: subTextStyle,
                      ),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget inputpassword() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Password',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                )),
            SizedBox(height: 12),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_password.png',
                      width: 17,
                      height: 12,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                        child: TextFormField(
                      controller: passwordController,
                      style: primaryTextStyle,
                      obscureText: true,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Your Password',
                        hintStyle: subTextStyle,
                      ),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget buttonsign() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: login,
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Text(
            'Sign in',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'don\'t have an account? ',
              style: subTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sign-up');
              },
              child: Text(
                'Sign Up',
                style: purpleTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            inputemail(),
            inputpassword(),
            isloading ? Loading() : buttonsign(),
            Spacer(),
            footer()
          ],
        ),
      )),
    );
  }
}

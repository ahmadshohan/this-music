import 'package:flutter/material.dart';
import 'package:this_music/login/login_page.dart';
import 'package:this_music/register/register_page.dart';
import 'package:this_music/shared/widgets/j_outline_button.dart';
import 'package:this_music/shared/widgets/j_raised_buttonborder.dart';

class WelcomePage extends StatefulWidget {
  static const routerName = '/welcome-page';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        left: false,
        right: false,
        child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/jpg/welcome_bg.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'This Music',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Image.asset(
                            'assets/png/welcome_logo.png',
                            height: 100,
                            width: 100,
                          ),
                        ],
                      ),
                      Text(
                        'İçindeki Ritmi Keşfet!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      JRaisedButtonBorder(
                        onPressed: () => Navigator.pushNamed(
                            context, RegisterPage.routerName),
                        text: 'Kayıt Ol',
                        color: Color(0xFFE3D2A3),
                      ),
                      SizedBox(height: 5),
                      JOutlineButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, LoginPage.routerName),
                        text: 'Giriş Yap',
                        color: Color(0xFFE3D2A3),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

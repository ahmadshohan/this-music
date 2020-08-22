import 'package:flutter/material.dart';
import 'package:this_music/shared/widgets/j_outline_button.dart';
import 'package:this_music/shared/widgets/j_raised_buttonborder.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = '/welcome-page';
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
                          Image.asset(
                            'assets/png/logo2.png',
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            'This Music',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
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
                      GestureDetector(
                        onTap: () {},
                        child: JRaisedButtonBorder(
                          onPressed: () {},
                          text: 'Kayıt Ol',
                          color: Color(0xFFE3D2A3),
                        ),
                      ),
                      SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {},
                        child: JOutlineButton(
                          onPressed: () {},
                          text: 'Giriş Yap',
                          color: Color(0xFFE3D2A3),
                        ),
                      ),
//                      Text('facebook',
//                          textAlign: TextAlign.center,
//                          style: Theme.of(context)
//                              .textTheme
//                              .subtitle1
//                              .copyWith(color: ThisMusicColors.white)),
//                      Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: <Widget>[
//                            Expanded(
//                              flex: 1,
//                              child: SizedBox(
//                                height: 45,
//                                child: JIconRaisedButton(
//                                    onPressed: () {},
//                                    fontSize: 10,
////                                    text:
////                                        MediaQuery.of(context).size.width < 325
////                                            ? ''
////                                            : AppLocalization.facebook,
//                                    icon: 'assets/png/facebook.png',
//                                    textColor: ThisMusicColors.white,
//                                    color: ThisMusicColors.facebookButton),
//                              ),
//                            ),
//                            Expanded(
//                              flex: 1,
//                              child: SizedBox(
//                                height: 45,
//                                child: JIconRaisedButton(
//                                    onPressed: () {},
//                                    fontSize: 10,
////                                    text:
////                                        MediaQuery.of(context).size.width < 325
//////                                            ? ''
//////                                            : AppLocalization.google,
//                                    icon: 'assets/png/google.png',
//                                    textColor: ThisMusicColors.white,
//                                    color: ThisMusicColors.googleButton),
//                              ),
//                            ),
//                            Expanded(
//                              flex: 1,
//                              child: SizedBox(
//                                height: 45,
//                                child: JIconRaisedButton(
//                                    onPressed: () {},
//                                    fontSize: 10,
////                                    text:
////                                        MediaQuery.of(context).size.width < 325
////                                            ? ''
////                                            : AppLocalization.apple,
//                                    icon: 'assets/png/apple.png',
//                                    textColor: ThisMusicColors.black,
//                                    color: ThisMusicColors.white),
//                              ),
//                            )
//                          ]),
                    ],
                  ),
//                    Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[

//
//                      ],
//                    ),
                )
              ],
            )),
      ),
    );
    ;
  }
}

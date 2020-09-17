import 'package:flutter/material.dart';
import 'package:this_music/app_route.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/shared/widgets/j_raised_button.dart';

class SendEmailNoticeDialog {
  static showSendEmailDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
              contentPadding: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              children: <Widget>[
                SizedBox(
                    child: Image.asset('assets/png/sendCase.png',
                        width: 50, height: 50)),
                SizedBox(height: 10),
                Text(AppLocalization.yourRequestSent,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
                SizedBox(height: 10),
                SizedBox(
                    height: 40,
                    child: JRaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(
                              context, AppRoute.loginRoute);
                        },
                        text: AppLocalization.continueLabel))
              ]);
        });
  }
}

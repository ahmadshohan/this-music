import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

class DatePicker {
  Future showAndroidDatePicker(BuildContext context) async {
    DateTime newDateTime = await showRoundedDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 60),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 16,
      theme: ThemeData.dark(),
    );
    return newDateTime;
  }

  Future showIosDatePicker(BuildContext context) async {
    DateTime newDateTime = await CupertinoRoundedDatePicker.show(
      context,
      fontFamily: "Mali",
      textColor: Colors.white,
      background: Colors.red[300],
      borderRadius: 16,
      initialDatePickerMode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (dateTime) {
        return dateTime;
      },
    );
    return newDateTime;
  }
}

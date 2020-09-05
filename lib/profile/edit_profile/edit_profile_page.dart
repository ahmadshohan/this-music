import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:this_music/colors.dart';
import 'package:this_music/shared/localization/app_localization.dart';
import 'package:this_music/shared/widgets/closable.dart';
import 'package:this_music/shared/widgets/j_raised_button.dart';
import 'package:this_music/shared/widgets/toaster.dart';

class EditProfilePage extends StatefulWidget {
  final String title;
  const EditProfilePage({Key key, this.title = "EditCustomerProfile"})
      : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File pictureFile;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThisMusicColors.BottomPanel,
        appBar: AppBar(
            backgroundColor: ThisMusicColors.button,
            title: Text(AppLocalization.profile,
                style: TextStyle(color: Colors.white))),
        body: SafeArea(
            top: true,
            bottom: true,
            left: false,
            right: false,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                Form(key: _formKey, child: _buildPersonalInfo()),
                SizedBox(height: 10),
                _buildUpdate(),
                SizedBox(height: 10),
                _buildThisMusicLogo(),
              ])),
            )));
  }

  _buildPersonalInfo() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(AppLocalization.personalInformation,
                  style: TextStyle(
                      color: ThisMusicColors.white,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 13),
              _buildAvatar(),
              SizedBox(height: 13),
              _buildName(),
              SizedBox(height: 13),
              _buildPhoneNumber(),
              SizedBox(height: 13),
              _buildEmail(),
              SizedBox(height: 13),
              _buildPassword(),
            ]));
  }

  _buildAvatar() {
    return GestureDetector(
      onTap: () => _buildProfilePictureSelector(),
      child: Stack(children: <Widget>[
        CircleAvatar(
            radius: 50,
            backgroundColor: Colors.black12,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: pictureFile == null
                  ? Image.asset('assets/png/avatar.png',
                      width: 100, height: 100, fit: BoxFit.cover)
                  : Image.file(pictureFile,
                      width: 100, height: 100, fit: BoxFit.cover),
            )),
        Positioned(
            right: 3,
            bottom: 10,
            child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green),
                child: Icon(Icons.camera_alt, color: Colors.white, size: 16))),
      ]),
    );
  }

  _buildName() {
    return TextFormField(
        style: TextStyle(color: ThisMusicColors.white),
        decoration: InputDecoration(
            labelText: AppLocalization.yourName,
            fillColor: Colors.white30,
            filled: true,
            labelStyle: TextStyle(color: ThisMusicColors.white),
            contentPadding: EdgeInsets.all(16),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ThisMusicColors.button)),
            border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5))));
  }

  _buildPhoneNumber() {
    return TextFormField(
        style: TextStyle(color: ThisMusicColors.white),
        decoration: InputDecoration(
            labelText: AppLocalization.phoneNumber,
            filled: true,
            fillColor: Colors.white30,
            labelStyle: TextStyle(color: ThisMusicColors.white),
            contentPadding: EdgeInsets.all(16),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ThisMusicColors.button)),
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5),
            )));
  }

  _buildEmail() {
    return TextFormField(
        style: TextStyle(color: ThisMusicColors.white),
        decoration: InputDecoration(
            labelText: AppLocalization.email,
            fillColor: Colors.white30,
            filled: true,
            labelStyle: TextStyle(color: ThisMusicColors.white),
            contentPadding: EdgeInsets.all(16),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ThisMusicColors.button)),
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5),
            )));
  }

  _buildPassword() {
    return TextFormField(
        style: TextStyle(color: ThisMusicColors.white),
        decoration: InputDecoration(
            labelText: AppLocalization.password,
            fillColor: Colors.white30,
            filled: true,
            labelStyle: TextStyle(color: ThisMusicColors.white),
            contentPadding: EdgeInsets.all(16),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ThisMusicColors.button)),
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5),
            )));
  }

  _buildUpdate() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: JRaisedButton(
          onPressed: () => Navigator.pop(context),
          text: AppLocalization.update),
    );
  }

  _buildThisMusicLogo() {
    return Image.asset(
      "assets/png/app_logo.png",
      height: MediaQuery.of(context).size.height * 0.25,
    );
  }

  _buildProfilePictureSelector() {
    showModalBottomSheet<dynamic>(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: ThisMusicColors.BottomPanel,
            child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF737373),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                height: 80,
                padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                width: MediaQuery.of(context).size.width,
                child: SafeArea(
                  top: false,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              _openCamera();
                            },
                            child: Column(children: <Widget>[
                              SvgPicture.asset('assets/svg/camera.svg',
                                  color: ThisMusicColors.white,
                                  width: 30,
                                  height: 30),
                              SizedBox(height: 5),
                              Text(AppLocalization.camera,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(color: ThisMusicColors.white))
                            ])),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              _openGallery();
                            },
                            child: Column(children: <Widget>[
                              SvgPicture.asset('assets/svg/gallery.svg',
                                  color: ThisMusicColors.white,
                                  width: 30,
                                  height: 30),
                              SizedBox(height: 5),
                              Text(AppLocalization.gallery,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(color: ThisMusicColors.white))
                            ]))
                      ]),
                )),
          );
        });
  }

  _openCamera() {
    KeyBoard.close(context);
    ImagePicker()
        .getImage(source: ImageSource.camera, maxHeight: 200)
        .then((picture) {
      setState(() {
        pictureFile = File(picture.path);
        print(picture.path);
      });
    }).catchError((e) {
      Toaster.warning(AppLocalization.openCameraPermission);
    });
  }

  _openGallery() async {
    KeyBoard.close(context);
    ImagePicker()
        .getImage(source: ImageSource.gallery, maxHeight: 200)
        .then((picture) {
      setState(() {
        pictureFile = File(picture.path);
      });
    }).catchError((e) {
      Toaster.warning(AppLocalization.openGalleryPermission);
    });
  }
}

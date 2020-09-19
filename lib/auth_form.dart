import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login_screen/fade_animation.dart';

import 'already_have.dart';
import 'rounded_button.dart';
import 'rounded_input.dart';
import 'rounded_password.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthForm extends StatefulWidget {
  AuthForm(
    this.submitFn,
    this.isLoading,
  );

  final bool isLoading;
  final void Function(
    String email,
    String password,
    String userName,
    File image,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  File _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        SizedBox(
          height: _isLogin ? size.height * 0.05 : size.height * 0.05,
        ),
        FadeAnimation(
          1,
          Container(
            height: 140,
            child: Image.asset(
              "assets/images/yesil.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              margin: EdgeInsets.only(top: 0, left: 35, right: 35, bottom: 35),
              height: _isLogin ? 470 : 440,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      if (_isLogin)
                        SizedBox(
                          height: 5,
                        ),
                      if (_isLogin)
                        CircleAvatar(
                          radius: 45,
                          child: Image.asset("assets/images/pp.png"),
                        ),
                      if (_isLogin)
                        SizedBox(
                          height: 10,
                        ),
                        RoundedInputField(
                          hintText: "Username",
                          onChanged: (value) {},
                          icon: Icons.perm_identity,
                        ),
                      if (!_isLogin)
                        RoundedInputField(
                          hintText: "Email",
                          onChanged: (value) {},
                        ),
                      RoundedPasswordField(
                        onChanged: (value) {},
                      ),
                      RoundedButton(
                        text: _isLogin ? "LOGIN" : "SIGNUP",
                        press: () {},
                      ),
                      SizedBox(height: size.height * 0.01),
                      AlreadyHaveAnAccountCheck(
                        login: _isLogin,
                        press: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Text(
                        "OR",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: size.height * 0.017,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.indigo,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              "assets/images/facebook.svg",
                              color: Colors.indigo,
                              height: 15,
                              width: 15,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.indigo,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              "assets/images/google.svg",
                              height: 15,
                              width: 15,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.indigo,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              "assets/images/twitter.svg",
                              color: Colors.indigo,
                              height: 15,
                              width: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

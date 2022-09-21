// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:authapp/view/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import '../global/AppColors.dart';
import '../model/UserModel.dart';
import '../provider/UserProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool login = false;
  User? user;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);

      if (await getSharedUser() == true) {
        print("in if");
        userProvider.user = user;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        print("false");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
      // await BorrowBookController().getPostals(context);
    });
  }

  Future<bool> getSharedUser() async {
    print("in method;");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? getUser = preferences.getString('sUser');

    if (getUser != null) {
      Map<String, dynamic> userMap = jsonDecode(getUser);
      print(userMap);
      user = User.fromJson(userMap);
      print(user!.EmailID);
      print("User ID:" + user!.UserId.toString());
      return true;
    } else {
      print("in null");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.secondary,
        child: Center(
          child: Text(
            "AuthApp",
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}


// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:authapp/view/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../controller/LoginSignupController.dart';
import '../global/AppColors.dart';
import '../provider/UserProvider.dart';
import 'ForgotPasswordScreen.dart';
import 'RegisterScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailIdC = TextEditingController();
  TextEditingController passC = TextEditingController();
  bool showPasswordText = false;

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    return Container(
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.light3,
                        ),
                        child: Icon(
                          Icons.account_circle_outlined,
                          color: AppColors.secondary,
                          size: 44,
                        )),
                    SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Text(
                        "Sign In to unlock the full experience",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.dark2,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: emailIdC,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black45, width: 0.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          hintText: "Email Id",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: passC,
                        obscureText: !showPasswordText,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black45, width: 0.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          hintText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              showPasswordText
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: AppColors.dark3,
                            ),
                            onPressed: () => setState(
                              () => showPasswordText = !showPasswordText,
                            ),
                          ),
                        ),
                        onChanged: (str) => setState(() {}),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        // ignore: sort_child_properties_last
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(color: AppColors.secondary),
                        ),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ForgotPasswordScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                        width: double.maxFinite,
                        child: ElevatedButton(
                          child: Text("Sign In"),
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.secondary,
                              padding: EdgeInsets.all(16)),
                          onPressed: () async {
                            userProvider.user = await LoginSignupController()
                                .getLoggedInUser(emailIdC.text, passC.text);
                            userProvider.notifyListeners();

                            print(userProvider.user?.Status ?? 0);
                            if (userProvider.user!.Status == 1) {
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            } else {
                              final snackBar = SnackBar(
                                duration: Duration(seconds: 3),
                                behavior: SnackBarBehavior.floating,
                                content: const Text('Invalid Credentials'),
                                margin: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 8),
                                backgroundColor: Colors.black87,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                        )),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "OR",
                          style: TextStyle(color: Colors.black54),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    OutlinedButton(
                        // ignore: sort_child_properties_last
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: SvgPicture.asset(
                                "assets/images/google.svg",
                                height: 24,
                                width: 24,
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              "Continue with Google",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.light4,
                          side: BorderSide(color: Colors.black45, width: 0.5),
                        ),
                        onPressed: () => {}),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        TextButton(
                          // ignore: sort_child_properties_last
                          child: Text(
                            "Register Now",
                            style: TextStyle(color: AppColors.secondary),
                          ),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget TextFormField(String hint, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          hintText: hint,
        ),
      ),
    );
  }
}

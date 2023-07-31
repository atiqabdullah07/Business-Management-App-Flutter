import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smokin_joes/Constants/AppText.dart';

import '../Constants/colors.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController companyNameController = TextEditingController();

  SignUp({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUp> createState() => _LoginState();
}

class _LoginState extends State<SignUp> {
  bool passwordVisible = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70.h),
              child: SizedBox(
                height: 300.h,
                width: 1.sw,
                child: Center(
                  child: SvgPicture.asset('Images/logo2.svg'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    AppText(
                        title: 'Fill In Your Information',
                        color: AppColors.secondary,
                        size: 22.r,
                        fontWeight: FontWeight.w600),
                    SizedBox(
                      height: 20.h,
                    ),
                    RoundedTextBox(
                      title: 'Email',
                      hinttext: 'admin@email.com',
                      iconImagePath: 'Images/icons8_mail.png',
                      obsecureText: false,
                      textEditingController: SignUp.emailController,
                      validator: (value) {
                        if (RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}')
                            .hasMatch(value!)) {
                        } else {}
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    RoundedTextBox(
                      title: 'Password',
                      hinttext: 'admin123',
                      iconImagePath: 'Images/icons8_eye.png',
                      obsecureText: passwordVisible,
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      textEditingController: SignUp.passwordController,
                      /*validator: (value) {
                        if (value!.length != 11) {
                          return 'Please Enter a Valid password';
                        }
                      },*/
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    RoundedTextBox(
                      title: 'Company',
                      hinttext: 'JB Wine In Spirt',
                      iconImagePath: 'Images/icons8_company.png',
                      obsecureText: false,
                      textEditingController: SignUp.companyNameController,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    RoundedButton(
                        text: 'Sign Up',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            var snackBar = const SnackBar(
                              content:
                                  Text('Account has been created Successfully'),
                              duration: Duration(seconds: 1),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            return;
                          }
                        }),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 120.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                    title: "Already have an account.",
                    color: AppColors.secondary,
                    size: 13.sp,
                    fontWeight: FontWeight.w500),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: AppText(
                      title: "Log In",
                      color: const Color(0XFFE11941),
                      size: 13.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    ));
  }
}



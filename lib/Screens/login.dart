import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/HelperFunctions/login_validation.dart';
import 'package:smokin_joes/Screens/BottomNavigationBar.dart';
import 'package:smokin_joes/Screens/Home.dart';
import 'package:smokin_joes/Screens/sign_up.dart';
import 'package:smokin_joes/WebHandler/DashboardController.dart';

import '../Constants/colors.dart';

class Login extends StatefulWidget {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordVisible = true;

  final DashboardController dashboardController = DashboardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: WillPopScope(
          onWillPop: () async {
            Dialogs.bottomMaterialDialog(
              msg: 'Are you sure you want to exit the app?',
              title: 'Exit App',
              context: context,
              actions: [
                IconsOutlineButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    return false;
                  },
                  text: 'Cancel',
                  iconData: Icons.cancel_outlined,
                  textStyle: const TextStyle(color: Colors.grey),
                  iconColor: Colors.grey,
                ),
                IconsButton(
                  onPressed: () {
                    SystemNavigator.pop();
                    return true;
                  },
                  text: 'Yes',
                  iconData: Icons.exit_to_app,
                  color: Colors.red,
                  textStyle: const TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                ),
              ],
            );

            return false;
          },
          child: SingleChildScrollView(
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
                  child: Column(
                    children: [
                      AppText(
                          title: 'Sign in to Continue',
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
                        textEditingController:
                            dashboardController.emailController,
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
                        textEditingController:
                            dashboardController.passwordController,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      RoundedButton(
                        text: 'Sign In',
                        onPressed: () {
                          // await LoginValidation().validation(
                          //   email: dashboardController.emailController.text,
                          //   password:
                          //       dashboardController.passwordController.text,
                          // );
                          Get.to(BNB());
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: AppText(
                            title: 'Forgot Password?',
                            color: AppColors.secondary,
                            size: 13.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 120.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                        title: "Don't have an account.",
                        color: AppColors.secondary,
                        size: 13.sp,
                        fontWeight: FontWeight.w500),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: AppText(
                          title: "Register Now",
                          color: const Color(0XFFE11941),
                          size: 13.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 70.h,
        width: 1.sw,
        decoration: const BoxDecoration(
          color: AppColors.tertiary,
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        child: Center(
          child: AppText(
              title: text,
              color: Colors.white,
              size: 14.sp,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class RoundedTextBox extends StatelessWidget {
  final String title;
  final String hinttext;
  final String iconImagePath;
  final VoidCallback? onPressed;
  final bool obsecureText;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;

  const RoundedTextBox({
    Key? key,
    required this.title,
    required this.hinttext,
    required this.iconImagePath,
    this.onPressed,
    required this.obsecureText,
    required this.textEditingController,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 1.sw,
      decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          border: Border.all(
            color: Colors.grey,
            width: 1.5,
          )),
      child: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                          title: title,
                          color: AppColors.secondary,
                          size: 10.sp,
                          fontWeight: FontWeight.normal),
                      SizedBox(
                        height: 5.h,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40.h,
                          width: 1.sw,
                          child: TextFormField(
                            controller: textEditingController,
                            obscureText: obsecureText,
                            obscuringCharacter: '●',
                            cursorColor: AppColors.tertiary,
                            style: GoogleFonts.manrope(
                                textStyle: TextStyle(
                                    color: AppColors.secondary,
                                    fontSize: 16.sp,
                                    // height: 1.h,
                                    fontWeight: FontWeight.w500)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: hinttext,
                              hintStyle: GoogleFonts.manrope(
                                  textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500)),
                            ),
                            /* validator: (value) {
                              if (value!.isEmpty) {
                                return 'Required';
                              } else {
                                return null;
                              }
                            },*/
                            validator: validator,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: onPressed,
              icon: ImageIcon(
                AssetImage(
                  iconImagePath,
                ),
                size: 25.r,
                color: AppColors.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

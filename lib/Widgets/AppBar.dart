import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/colors.dart';
import '../Widgets/AlertDialoge.dart';

class APPBAR extends StatefulWidget implements PreferredSizeWidget {
  void Function() ontap;

  APPBAR({Key? key, required this.ontap}) : super(key: key);

  @override
  State<APPBAR> createState() => _APPBARState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}

class _APPBARState extends State<APPBAR> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        key: widget.key,
        backgroundColor: AppColors.primary,
        elevation: 0,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 30.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: widget.ontap,
                      icon: ImageIcon(
                        const AssetImage('Images/menu_icon.png'),
                        size: 60.r,
                        color: Colors.black,
                      ),
                    ),
                    SvgPicture.asset('Images/logo.svg'),
                    GestureDetector(
                      onTap: () {
                        {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog1();
                              });
                        }
                      },
                      child: CircleAvatar(
                        radius: 20.r,
                        backgroundImage:
                            const AssetImage('Images/profilePic.png'),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)),
        ));
  }
}

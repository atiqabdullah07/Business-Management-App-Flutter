import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class SwitchButton extends StatelessWidget {
  final String switchStatus;
  final Function onPress;

  const SwitchButton(
      {Key? key, required this.switchStatus, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      onPressed: () {
        onPress();
      },
      icon: Transform.scale(
        scale: 0.6,
        child: CupertinoSwitch(
          value:
              switchStatus == "Activated" || switchStatus == '1' ? true : false,
          activeColor: AppColors.tertiary,
          trackColor: const Color(0xffE11941),
          onChanged: (value) {
            onPress();
          },
        ),
      ),
    );
  }
}

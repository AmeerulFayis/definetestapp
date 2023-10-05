import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

import 'app_text_view.dart';

Widget appButton(final Function() onPressedAction, BuildContext context,
    {String name = "",
    double size = 14,
    int maxLines = 1,
    Color color = AppColor.kGreen,
      required double width,
      required double height,
      double radius=5,
    Color textColor = AppColor.kBlack,
    bool isBold = false,
    bool isUnderLine = false,
    TextAlign align = TextAlign.start}) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(

          backgroundColor: color,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          )),
      onPressed: onPressedAction,
      child: appTextView(name: name, color: textColor, isBold: true,size: 18),
    ),
  );
}

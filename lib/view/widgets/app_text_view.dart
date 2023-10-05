import 'package:flutter/material.dart';

import '../../utils/app_color.dart';


Widget appTextView({
  String name = "",
  double size = 14,
  int maxLines = 1,
  Color color = AppColor.kWhite,
  bool isBold = false,
  bool softWrap=false,
  bool isUnderLine = false,
  TextAlign align = TextAlign.start,
  FontStyle fontStyle=FontStyle.normal
}) {

  return Text(
    name,
    textAlign: align,
    softWrap: softWrap,
    style: TextStyle(
overflow: TextOverflow.ellipsis,
      fontStyle: fontStyle,
      fontFamily: 'Inter',
        decoration: isUnderLine ? TextDecoration.underline : TextDecoration.none,
        fontSize: size,
        height: 1.5,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
        color: color),
    overflow: TextOverflow.ellipsis,


    maxLines: maxLines,
  );
}

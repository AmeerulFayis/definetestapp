import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_constant.dart';

Widget appTextField(
  TextEditingController controller,
  Widget suffixIcon, {
  String hintText = "",
  double size = 14,
  TextInputType inputType = TextInputType.name,
  TextInputAction inputAction = TextInputAction.done,
      int lines=1,
      bool obscureText=false,
     bool isEnabled=true
}) {
  return TextField(
    enabled:isEnabled,
    obscureText: obscureText,
    maxLines: lines,
    style: TextStyle(
      color:AppColor.kBlack
    ),


    controller: controller,
    keyboardType: inputType,
    textInputAction: inputAction,
    decoration: InputDecoration(
      fillColor: AppColor.kWhite,
      filled: true,
      isDense: true,

      hintStyle: const TextStyle(

        fontSize: 14,
        color: AppColor.kGrey,
      ),
      suffixIcon: suffixIcon,
      hintText: hintText,



      contentPadding: commonPaddingAll,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide:
            BorderSide(width: 0.3, color: AppColor.kGrey.withOpacity(0.4)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide:
            BorderSide(width: 1, color: AppColor.kBlue.withOpacity(0.6)),
      ),
    ),
  );
}

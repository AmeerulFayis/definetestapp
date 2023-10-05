import 'package:flutter/material.dart';

//images
String icLogo = 'assets/images/ic_logo.jpg';
String icProfile = 'assets/images/ic_profile.jpg';
String icQtImg = 'assets/images/ic_qt_image.jpg';




//screen size

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}



double screenHeight(context) {

  return MediaQuery.of(context).size.height ;
}

// padding size
EdgeInsets commonPaddingAll = const EdgeInsets.all(10);
EdgeInsets commonPaddingAll20 = const EdgeInsets.all(20);
EdgeInsets commonPaddingAll30 = const EdgeInsets.all(30);
EdgeInsets commonPaddingAll15 = const EdgeInsets.all(15);
EdgeInsets commonPaddingAllOnBoard = const EdgeInsets.all(50);
EdgeInsets commonPaddingAll5 = const EdgeInsets.all(5);
EdgeInsets commonPaddingLR = const EdgeInsets.only(left: 10, right: 10);
EdgeInsets commonPaddingLR20 = const EdgeInsets.only(left: 20, right: 20);
EdgeInsets commonPaddingLR30 = const EdgeInsets.only(left: 30, right: 30);
EdgeInsets commonPaddingTB = const EdgeInsets.only(top: 10, bottom: 10);
EdgeInsets commonPaddingTB5 = const EdgeInsets.only(top: 5, bottom: 5);
EdgeInsets commonPaddingLR5 = const EdgeInsets.only(left: 5, right: 5);
EdgeInsets commonBgPadding = const EdgeInsets.only(
  left: 15,
  right: 15,
);

//divider

Widget dividerH() {
  return const SizedBox(height: 20);
}

Widget dividerLH() {
  return const SizedBox(height: 12);
}

Widget dividerSH() {
  return const SizedBox(height: 8);
}

Widget dividerSSH() {
  return const SizedBox(height: 5);
}

Widget dividerSW() {
  return const SizedBox(width: 8);
}

Widget dividerSSW() {
  return const SizedBox(width: 3);
}

Widget dividerW() {
  return const SizedBox(width: 20);
}
Widget divider30() {
  return const SizedBox(height: 30);

}Widget divider20() {
  return const SizedBox(height: 20);
}

Widget dividerTB50() {
  return const SizedBox(height: 50);
}


//for constant string
 const String  push ="push";
 const String  reminder ="reminder";
 const String  call ="call";
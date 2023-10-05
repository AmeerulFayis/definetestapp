import 'dart:async';

import 'package:definetestapp/utils/app_constant.dart';
import 'package:definetestapp/utils/app_sp.dart';
import 'package:definetestapp/view/pages/home_page/home_page.dart';
import 'package:definetestapp/view/pages/login_page/login_page.dart';
import 'package:definetestapp/view/widgets/app_text_view.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //Future isLogged=AppSp().getIsLogged();
  @override
  void initState() {
Timer(const Duration(seconds: 3), ()async {
  bool isLogged=await AppSp().getIsLogged();
  if(isLogged){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
  }else{
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
  }

});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Center(child: appTextView(name: "mimo",color: AppColor.kBlack,size: 70,isBold: true,fontStyle: FontStyle.italic)),
      ),
    );
  }
}

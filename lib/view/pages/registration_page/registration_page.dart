import 'dart:developer';


import 'package:definetestapp/view/pages/home_page/home_page.dart';
import 'package:definetestapp/view/pages/login_page/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_constant.dart';
import '../../../utils/common_methods.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_filed.dart';
import '../../widgets/app_text_view.dart';
import 'bloc/registration_bloc.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool obscureText = false;
  TextEditingController emailController = TextEditingController();
  // TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController confirmPassController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => RegistrationBloc(),
  child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        title: appTextView(name: "Create an Account",isBold: true,color: AppColor.kBlack,size: 18),
        centerTitle: true,
      ),
      body: Padding(
        padding: commonPaddingAll,
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            dividerSH(),
            // appTextField(nameController, Icon(Icons.person),hintText: "Full Name"),
            dividerH(),
            appTextField(emailController, Icon(Icons.email_outlined),hintText: "Email"),
            dividerH(),
            appTextField(passwordController, IconButton(onPressed: (){
setState(() {
  obscureText = !obscureText;
});
            }, icon: Icon(obscureText==true?Icons.visibility_off
                : Icons.visibility)),hintText: "Password",obscureText: obscureText),
            dividerH(),
            // appTextField(confirmPassController, IconButton(onPressed: (){
            //   setState(() {
            //     obscureText = !obscureText;
            //   });
            // }, icon: Icon(obscureText==true?Icons.visibility_off
            //     : Icons.visibility)),hintText: "Confirm Password",obscureText: obscureText),
            dividerH(),
            Center(child: BlocConsumer<RegistrationBloc, RegistrationState>(
  listener: (context, state) {
if(state is RegistraionSuccess){
Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
}

  },
  builder: (context, state) {
    return appButton(() {
      if (checkMultipleClick(DateTime.now())) {
        return;
      }
      if(emailController.text.isEmpty || passwordController.text.isEmpty){
        EasyLoading.showToast("enter email and password");
        if(emailController.text.isEmpty){
          EasyLoading.showToast("enter valid email");
        }if(passwordController.text.isEmpty || passwordController.text.length<=6){
          EasyLoading.showToast("enter valid password");
        }

      }else{
        BlocProvider.of<RegistrationBloc>(context).add(RegistrationButtonEvent(emailController.text, passwordController.text));
      }

    }, context, width: 200, height: 50,radius: 5,name: "Register",color:AppColor.kBlue,textColor: AppColor.kWhite);
  },
)),
            dividerH(),
            Center(
              child: RichText(
                text: TextSpan(
                  text:"Already have an account?  ",
                  style: TextStyle(fontSize: 15,color: AppColor.kBlack),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Log In',
                        style: const TextStyle(fontWeight: FontWeight.bold,color: AppColor.kBlack,decoration: TextDecoration.underline),recognizer: TapGestureRecognizer()..onTap=(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
);
  }
}

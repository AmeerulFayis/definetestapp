import 'package:definetestapp/utils/app_color.dart';
import 'package:definetestapp/utils/app_constant.dart';
import 'package:definetestapp/view/pages/forget_password/forget_password_page.dart';
import 'package:definetestapp/view/pages/login_page/bloc/login_bloc.dart';
import 'package:definetestapp/view/widgets/app_button.dart';
import 'package:definetestapp/view/widgets/app_text_filed.dart';
import 'package:definetestapp/view/widgets/app_text_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../utils/app_sp.dart';
import '../../../utils/common_methods.dart';
import '../home_page/home_page.dart';
import '../registration_page/registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
  create: (context) => LoginBloc(),
  child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: Container(
        padding: commonPaddingAll15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
         appTextView(name: "mimo",color: AppColor.kBlack,size: 70,isBold: true,fontStyle: FontStyle.italic),
          dividerH(),
          appTextField(emailController, Icon(Icons.person),hintText: "Email"),
          dividerH(),
          appTextField(passwordController,IconButton(onPressed: (){
            setState(() {
              obscureText = !obscureText;
            });
          }, icon: Icon(obscureText==true?Icons.visibility_off
              : Icons.visibility)),hintText: "Password",obscureText: obscureText),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgetPasswordPage()));
            }, child:appTextView(name: "Forget Password ?",color: AppColor.kBlack,isBold: true)),
          ),
          BlocConsumer<LoginBloc, LoginState>(
  listener: (context, state) {
    if(state is LoginSuccess){
      AppSp().setIsLogged(true);

Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const HomePage()), (route) => false);
    }

  },
  builder: (context, state) {
    return appButton(() {
      if (checkMultipleClick(DateTime.now())) {
        return;
      }
if(emailController.text.isEmpty || passwordController.text.isEmpty){
EasyLoading.showToast("Enter email and pasword");
if(emailController.text.isEmpty){
  EasyLoading.showToast("please enter a valid Email");
}if(passwordController.text.isEmpty){
  EasyLoading.showToast("please enter a valid password");
}

}else{
  BlocProvider.of<LoginBloc>(context).add(
      LoginClickEvent(emailController.text, passwordController.text));
}



          }, context, width: 200, height: 50,radius: 5,name: "Login",color:AppColor.kBlue,textColor: AppColor.kWhite);
  },
),
            dividerH(),
            RichText(
              text: TextSpan(
                text:"Don't have an account ?  ",
                style: TextStyle(fontSize: 15,color: AppColor.kBlack),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Register Here',
                      style: const TextStyle(fontWeight: FontWeight.bold,color: AppColor.kBlack,decoration: TextDecoration.underline),recognizer: TapGestureRecognizer()..onTap=(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegistrationScreen()));
                  }),
                ],
              ),
            )
          ],
        ),
      )),
    ),
);
  }
}

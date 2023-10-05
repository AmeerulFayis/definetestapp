import 'package:definetestapp/utils/app_color.dart';
import 'package:definetestapp/utils/app_constant.dart';
import 'package:definetestapp/view/pages/forget_password/bloc/forgot_bloc.dart';
import 'package:definetestapp/view/widgets/app_button.dart';
import 'package:definetestapp/view/widgets/app_text_filed.dart';
import 'package:definetestapp/view/widgets/app_text_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../registration_page/registration_page.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
  create: (context) => ForgotBloc(),
  child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title:appTextView(name: "Forgot Password",color: Colors.black,isBold: true),
      ),
      body: Padding(
        padding: commonPaddingAll15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appTextField(emailController, Icon(Icons.email_outlined),hintText: "Email"),
            dividerSH(),
           const Text("Enter the email address you used to create your account and  we will email you  a link to reset your password.",softWrap: true,style:TextStyle(letterSpacing: 0.5,wordSpacing: 1.5,fontSize: 12)),
           dividerH(),
            BlocConsumer<ForgotBloc, ForgotState>(
  listener: (context, state) {


  },
  builder: (context, state) {
    return appButton((){
if(emailController.text.isEmpty){
  EasyLoading.showToast("Enter Email");
}else{
  BlocProvider.of<ForgotBloc>(context).add(ContinueButtonEvent(emailController.text));

}

            }, context, width: 250, height: 50,color: AppColor.kBlue,textColor: AppColor.kWhite,name: "CONTINUE");
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
      ),
    ),
);
  }
}

import 'package:definetestapp/utils/app_color.dart';
import 'package:definetestapp/utils/app_sp.dart';
import 'package:definetestapp/view/widgets/app_text_view.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_constant.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
 String email="";

 getEmail()async{
   email= await AppSp().getEmail();
   setState(() {

   });

 }


  @override
  void initState() {
  getEmail();
    super.initState();
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        elevation: 0,
        centerTitle: true,
        title: appTextView(name:"Settings",color: AppColor.kBlack,isBold: true),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

         Padding(
           padding: commonPaddingAll5,
           child: Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                     margin: commonPaddingAll5,
                     width: 50,
                     height: 200,
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       image: DecorationImage(
                           image: AssetImage(icProfile),
                           fit: BoxFit.fitHeight
                       ),
                     ),
                   ),
                   Column(
                     children: [
                       appTextView(name: "Malak Idrissi",color: AppColor.kBlack,isBold: true),
                       appTextView(name: email,color: AppColor.kBlack,)
                     ],
                   ),
                   Spacer(),
                   Container(
                       decoration: BoxDecoration(
                           color: AppColor.kBlackBrown,
                           borderRadius: BorderRadius.circular(25)
                       ),
                       child: IconButton(
                           color: AppColor.kWhite,
                           onPressed: (){}, icon: Icon(Icons.edit)))
                 ],
               ),
               const Text("Hi! My name is Malak,I'm a community manager from Rabat,Morrocco.",style: TextStyle(wordSpacing: 2,letterSpacing: 1.2),),
               dividerH(),
               dividerH(),
             ],
           ),
         ),
         Padding(
           padding: commonPaddingAll,
           child: Column(
             children: [
               InkWell(
                 onTap: (){},
                 child: Row(
                   children: [
                     Icon(Icons.notifications),
                     dividerW(),
                     appTextView(name:"Notifications",isBold: true,color: AppColor.kBlack),

                   ],
                 ),
               ),
               dividerH(),
               InkWell(
                 onTap: (){},
                 child: Row(
                   children: [
                     Icon(Icons.settings),
                     dividerW(),
                     appTextView(name:"General",isBold: true,color: AppColor.kBlack),

                   ],
                 ),
               ),
               dividerH(),
               InkWell(
                 onTap: (){},
                 child: Row(
                   children: [
                     Icon(Icons.person),
                     dividerW(),
                     appTextView(name:"Account",isBold: true,color: AppColor.kBlack),

                   ],
                 ),
               ),
               dividerH(),
               InkWell(
                 onTap: (){},
                 child: Row(
                   children: [
                     Icon(Icons.help_outline_rounded),
                     dividerW(),
                     appTextView(name:"About",isBold: true,color: AppColor.kBlack),

                   ],
                 ),
               ),
             ],
           ),
         )
        ],
      ),
    );
  }
}

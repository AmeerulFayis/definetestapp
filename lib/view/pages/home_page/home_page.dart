import 'dart:developer';

import 'package:definetestapp/utils/app_color.dart';
import 'package:definetestapp/utils/app_constant.dart';
import 'package:definetestapp/utils/app_sp.dart';
import 'package:definetestapp/view/pages/settings_page/settings_page.dart';
import 'package:definetestapp/view/widgets/app_text_view.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../todo_details_page/todo_details_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController categoryController=TextEditingController();
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("Categories");
  
 List categoryList=[];
  
// adding category
  void addCategory(
      )async {
    String uid=await AppSp().getUid();

    if(categoryController.text.isNotEmpty){
      int timeStamp=DateTime.now().millisecondsSinceEpoch;
      var categoryRef =
      ref.child(uid).child(timeStamp.toString());
      categoryRef.set({
        'Category Name': categoryController.text,
      });
      categoryController.clear();
      categoryList.clear();
      getCategory();
      Navigator.pop(context);


    }else{
      EasyLoading.showToast("Error while adding");
    }

  }

  // get Categories
getCategory()async{
    String uid=await AppSp().getUid();
var categoryRef=await ref.child(uid).get();
if(categoryRef.children.isNotEmpty){
  for(var element in categoryRef.children){
  final   countTask= await FirebaseDatabase.instance.ref("Task").child(uid).child("${element.child("Category Name").value}").get();


    categoryList.add({"title":"${element.child("Category Name").value}",
    "Count":"${countTask.children.length}"
    });
    setState(() {

    });
    log("${element.value}");
  }
}

}
  @override
  void initState() {
  getCategory();
    super.initState();
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: appTextView(name: "Categories",color: AppColor.kBlack,isBold: true),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
        leading: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsPage()));
          },
          child: Container(
            margin: commonPaddingAll5,
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(icProfile),
                  fit: BoxFit.fitHeight
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: commonPaddingAll,
            padding: commonPaddingAll5,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.kGrey.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(5),
              color: AppColor.kWhite
            ),
            child: Center(
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(icQtImg),
                          fit: BoxFit.fill
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      appTextView(name:'"The memories is a shield and life helper."',color: AppColor.kBlack),
                      appTextView(name:"Tamim Al-Barghouti",color: AppColor.kGrey),

                    ],
                  )

                ],
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: categoryList.length+1,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20), itemBuilder: (BuildContext context, int index) {
             if(index==0){
               return InkWell(
                 onTap: (){

                     showDialog(context: context, builder: (BuildContext context) {
                       return  AlertDialog(
                         content:
                         TextFormField(
                           controller: categoryController,
                           decoration: InputDecoration(
                               border: OutlineInputBorder()
                           ),
                         ),
                         actions: [
                           Center(child: ElevatedButton(onPressed:addCategory, child: Text("Add")))

                         ],
                       );
                     },);



                 },
                 child: Container(
                   margin: commonPaddingAll5,
                   child: Card(
                     elevation: 5,
                     child: Icon(Icons.add,size: 50,)

                   ),
                 ),
               );
             }else{
               return InkWell(
                 onTap: (){

Navigator.push(context, MaterialPageRoute(builder: (context)=>TodoDetails(categoryList[index-1]["title"]))).then((value) {
  categoryList.clear();
  getCategory();
});

                 },
                 child: Container(
                   margin: commonPaddingAll5,
                   child: Card(
                     elevation: 5,
                     child:Column(
                       children: [

                         appTextView(name: categoryList[index-1]["title"],isBold: true,color: AppColor.kBlack),
                         appTextView(name: categoryList[index-1]["Count"],isBold: true,color: AppColor.kBlack),
                       ],
                     ),
                   ),
                 ),
               );
             }

          },
              )

        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:definetestapp/utils/app_color.dart';
import 'package:definetestapp/utils/app_constant.dart';
import 'package:definetestapp/view/widgets/app_text_view.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../utils/app_sp.dart';

class TodoDetails extends StatefulWidget {
 final String title;
   const TodoDetails(this.title,{Key? key}) : super(key: key);

  @override
  State<TodoDetails> createState() => _TodoDetailsState();
}

class _TodoDetailsState extends State<TodoDetails> {
  TextEditingController taskController=TextEditingController();

  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("Task");

  List taskList=[];

// adding category
  void addTask(
      )async {
    String uid=await AppSp().getUid();

    if(taskController.text.isNotEmpty){
      int timeStamp=DateTime.now().millisecondsSinceEpoch;
      String dateTime="${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
      var categoryRef =
      ref.child(uid).child(widget.title).child(timeStamp.toString());
      categoryRef.set({
        'Task Name': taskController.text,
        'Date':dateTime,
        'completed':"false"
      });
      taskController.clear();
      taskList.clear();
      getData();
      Navigator.pop(context);


    }else{
      EasyLoading.showToast("Error while adding");
    }

  }

  // get Task
  void getData() async {
    String uid = await AppSp().getUid();

    DatabaseReference userTasksRef = ref.child(uid).child(widget.title);

    userTasksRef.orderByChild("Date").onChildAdded.listen(( event) {
      Map<dynamic, dynamic> taskData = event.snapshot.value as Map<dynamic, dynamic> ;
      String date = taskData["Date"];

      // Search for an entry with the same date in taskList
      int index = taskList.indexWhere((element) => element["Date"] == date);

      if (index == -1) {
        // Date not found, add a new entry
        taskList.add({
          "Date": date,
          "Tasks": [taskData],
        });
        setState(() {

        });

      } else {
        // Date found, add the task to the existing entry
        taskList[index]["Tasks"].add(taskData);
      }

    });
    setState(() {

    });
  }



  void markTaskAsCompleted() async {
    String uid = await AppSp().getUid();

    DatabaseReference userTasksRef = ref.child(uid).child(widget.title);

    // The task name of the task you want to mark as completed
    String taskNameToMarkCompleted = "hhhh"; // Replace with the actual task name

    Query query = userTasksRef.orderByChild("Task Name").equalTo(taskNameToMarkCompleted);

    query.get().then(( event) {
      log("llllll${(event.value)}");

      // ref.child(uid).child(widget.title).child(event.key.toString()).update({
      //   "completed": "true",
      // });
    });
  }



  bool isClicked=false;






  // getTask()async{
  //   String uid=await AppSp().getUid();
  //   var taskRef=await ref.child(uid).child(widget.title).get();
  //   if(taskRef.children.isNotEmpty){
  //     for(var element in taskRef.children){
  //
  //
  //       taskList.add("${element.child("Task Name").value}");
  //       setState(() {
  //
  //       });
  //       log("${element.value}");
  //     }
  //   }
  //
  // }



  @override
  void initState() {
    getData();
    super.initState();
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title:appTextView(name: widget.title,color: AppColor.kBlack,isBold: true),
        actions: [
          IconButton(onPressed: (){
            markTaskAsCompleted();
          }, icon: Icon(Icons.search))
        ],
      ),
      body:ListView(
        children: List.generate(taskList.length, (index) {
          return Padding(
            padding: commonPaddingAll15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appTextView(name: taskList[index]["Date"],color: AppColor.kBlack),
                ...List.generate(taskList[index]["Tasks"].length, (ind) {
                  return Row(
                    children: [
                      InkWell(
                        onTap: (){
                          log("message${taskList[index]}");
                          log("dddddd${taskList[index]["Tasks"][ind]}");
                        },
                        child: Padding(
                          padding: commonPaddingAll15,
                          child: Container(
                            height: 30,width: 30,decoration: BoxDecoration(
                            color:taskList[index]["Tasks"][ind]["completed"]== "true"? AppColor.kGreen:AppColor.kWhite,
                            shape: BoxShape.circle,
                            border: Border.all(width: 2,color: AppColor.kBlack)
                          ),
                          child: Visibility(
                            visible:taskList[index]["Tasks"][ind]["completed"]== "true"?true:false,
                              child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Icon(Icons.check,color: AppColor.kWhite,))),
                          ),
                        ),
                      ),
                      dividerSW(),
                      appTextView(name:taskList[index]["Tasks"][ind]["Task Name"],color: AppColor.kBlack),
                    ],
                  );
                })

              ],
            ),
          );
        })
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.kBlack,
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context) {
            return  AlertDialog(
              content:
              TextFormField(
                controller: taskController,
                decoration: InputDecoration(
                  hintText: " Enter Task",
                    border: OutlineInputBorder()
                ),
              ),
              actions: [
                Center(child: ElevatedButton(onPressed:addTask, child: Text("Add")))

              ],
            );
          },);
        },child: Icon(Icons.add),),

    );
  }
}

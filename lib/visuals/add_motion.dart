import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/controllers/data_controller.dart';
import 'package:flutter_golang_yt/visuals/task_list.dart';
import 'package:flutter_golang_yt/widgets/buttongets.dart';
import 'package:flutter_golang_yt/widgets/textfieldgets.dart';
import 'package:get/get_core/src/get_main.dart';
import '../colors/app_colors.dart';
import 'package:get/get.dart';

import '../widgets/error_message.dart';

class AddMotion extends StatelessWidget {
  const AddMotion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    
    bool _dataValidation(){
      if(nameController.text.trim()==''){
        Message.taskErrorMessage("Task Name", "Your task name empty");
        return false;
      }else if(detailController.text.trim()==''){
        Message.taskErrorMessage("Task detail", "Your detail  is empty");
        return false;
      }
      return true;
    }
    
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left:10, right:10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/addtask1.jpg"
            )
          )
        ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(

                children: [
                  SizedBox(height: 60,),
                  IconButton(onPressed: (){
                    Get.back();
                  },
                      icon: Icon(Icons.arrow_back,
                          color: AppColors.secondaryColor,
                      ))
                ]),
              Column(
                children: [
                  TextFieldWidget(textController: nameController,
                      hintText: "Task Name",
                  ),
                  SizedBox(height: 20,),
                  TextFieldWidget(textController: detailController,
                      hintText: "Task Detail",
                      borderRadius: 15,
                  maxLines: 3),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){

                      if(_dataValidation()){
                        Get.find<DataController>().postData(
                            nameController.text.trim(),
                            detailController.text.trim());


                        Get.to(()=>AllTasks(),
                        transition: Transition.circularReveal,

                        );

                      }
                    },
                    child: ButtonGet(bgrcolor: AppColors.mainColor,
                        text: "Add",
                        textColor: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/20,
              )
            ],
          ),
      ),

    );
  }
}



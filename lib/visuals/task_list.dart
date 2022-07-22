import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/colors/app_colors.dart';
import 'package:flutter_golang_yt/controllers/data_controller.dart';
import 'package:flutter_golang_yt/visuals/view_task.dart';
import 'package:flutter_golang_yt/widgets/buttongets.dart';
import 'package:flutter_golang_yt/widgets/taskgets.dart';
import 'package:get/get.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({Key? key}) : super(key: key);

  _loadData() async {
    await Get.find<DataController>().getData();
  }

  @override
  // void initState() {
  //   super.initState();
  //
  //   setState(() {
  //     _loadData();
  //   });
  // }
  Widget build(BuildContext context) {
    print(Get.find<DataController>().myData.length);

    _loadData();

    List myData = [
      "Try 1",
      "Try 2",
    ];
    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: (Colors.grey).withOpacity(0.5),
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
    );
    final rightEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: (Colors.red).withOpacity(0.5),
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerRight,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, top: 60),
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back, color: AppColors.secondaryColor,),
            ),
            width: double.maxFinite,
            height: MediaQuery
                .of(context)
                .size
                .height / 3.2,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/header1.jpg"
                    )
                )
            ),

          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Icon(Icons.home, color: AppColors.secondaryColor,),
                SizedBox(width: 10,),
                Container(
                  child: Icon(Icons.add, color: Colors.white, size: 20),
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.5),
                      color: Colors.black
                  ),
                ),
                Expanded(child: Container()),
                Icon(Icons.calendar_month_outlined,
                  color: AppColors.secondaryColor,),
                SizedBox(width: 10,),
                Text("2", style: TextStyle(
                    fontSize: 20,
                    color: AppColors.secondaryColor
                )),
              ],
            ),
          ),
          Flexible(
              child: GetBuilder<DataController>(builder: (controller) {
                return ListView.builder(
                    itemCount: controller.myData.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        background: leftEditIcon,
                        secondaryBackground: rightEditIcon,
                        onDismissed: (DismissDirection direction) {
                          print("after dismiss");
                        },
                        confirmDismiss: (DismissDirection direction) async {
                          if (direction == DismissDirection.startToEnd) {
                            showModalBottomSheet(
                                barrierColor: Colors.transparent,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (_) {
                                  return Container(
                                    height: 250,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFF2e3253),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)
                                        )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40, right: 40),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          GestureDetector(
                                            onTap:(){
                                              Get.off(()=>ViewTask(id: int.parse(controller.myData[index]["id"].toString())));
                                                  },
                                            child: ButtonGet(bgrcolor: Colors.white,
                                                text: "View",
                                                textColor: AppColors.mainColor),
                                          ),
                                          SizedBox(height: 20,),
                                          ButtonGet(bgrcolor: Colors.white,
                                              text: "Edit",
                                              textColor: AppColors.mainColor)
                                        ],
                                      ),
                                    ),
                                  );
                                });
                            return false;
                          } else {
                            return true;
                          }
                        },
                        key: ObjectKey(index),
                        child: Container(
                          margin: const EdgeInsets.only(left: 20,
                              right: 20,
                              bottom: 10),
                          child: TaskWidget(
                            text: controller.myData[index]["task_name"],
                            color: Colors.blueGrey,
                          ),
                        ),
                      );
                    });
              }
              )
          ),
        ],
      ),
    );
  }
}

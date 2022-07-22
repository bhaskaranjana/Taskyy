import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/colors/app_colors.dart';
import 'package:flutter_golang_yt/visuals/task_list.dart';
import 'package:flutter_golang_yt/widgets/buttongets.dart';
import 'package:get/get.dart';

import 'add_motion.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                  text: "Lavda",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 70,
                    fontWeight: FontWeight.bold
                  ),
                  children: [
                  TextSpan(
                      text: "\nLelo mera pls",
                      style: TextStyle(
                          color: AppColors.smallTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                      )

                )]

        )
      ),
            SizedBox(height: MediaQuery.of(context).size.height/2,),
            InkWell(
              onTap: (){
                Get.to(()=> AddMotion(), transition: Transition.zoom, duration: Duration(milliseconds:500));
              },
              child: ButtonGet(bgrcolor: AppColors.mainColor,
                  text: "Add Task",
                  textColor: Colors.white),
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: (){
                Get.to(()=>AllTasks(), transition: Transition.fade, duration: Duration(seconds: 1));
              },
              child: ButtonGet(bgrcolor: Colors.white,
                  text: "Ma Chuda",
                  textColor: AppColors.smallTextColor),
            ),
        ],
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/welcome.jpg"
            )
          )
        ),
      )
    );
  }
}

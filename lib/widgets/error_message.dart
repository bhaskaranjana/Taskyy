import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/colors/app_colors.dart';
import 'package:get/get.dart';


class Message{
  static void taskErrorMessage(String taskName, String taskErrorMessage){
    Get.snackbar(taskName, taskErrorMessage,
    backgroundColor: AppColors.mainColor,
    titleText: Text(
      taskName,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
        )
    ),
    messageText: Text(
        taskErrorMessage,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.yellow
        ),
    )
    );
  }
}
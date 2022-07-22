import 'package:flutter/cupertino.dart';
import 'package:flutter_golang_yt/controllers/data_controller.dart';
import 'package:get/get.dart';

class ViewTask extends StatelessWidget {
  final int id;
  const ViewTask({Key? key, required this.id}) : super(key: key);

  _loadSingleTask() async {
    print("passed id is"+id.toString());
   await  Get.find<DataController>().getSingleData();
  }
  @override
  Widget build(BuildContext context) {


    _loadSingleTask();

    return Container();
  }
}

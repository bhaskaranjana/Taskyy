import 'package:flutter_golang_yt/Utils/app_constants.dart';
import 'package:flutter_golang_yt/services/service.dart';
import 'package:get/get.dart';



class DataController extends GetxController{
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading=>_isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData=>_myData;

  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData(AppConstants.GET_TASKS);
    if(response.statusCode==200){
      _myData=response.body;
      print("Data Recieved");
      print(response.statusCode);
      update();
     }else{
      print("Data not received");
      print(response.statusCode);
      }
    _isLoading = false;
  }

  Future<void> getSingleData() async {
    _isLoading = true;
    Response response = await service.getData('${AppConstants.GET_TASK}''?id=$id');
    if(response.statusCode==200){
    //  _myData=response.body;
      print("Single Data Recieved");
      print(response.statusCode);
      update();
    }else{
      print("Data not received");
      print(response.statusCode);
      }
    _isLoading = false;
  }


  Future<void> postData(String task, String taskDetail) async {
    _isLoading = true;
    Response response = await service.postData(AppConstants.POST_TASK,{
      "task_name":task,
      "task_detail":taskDetail
    });
    if(response.statusCode==200){
      update();
      print("data post successful");
    }else{
      print("Data post failed");
      print(response.statusCode);

    }
    update();
  }
  }
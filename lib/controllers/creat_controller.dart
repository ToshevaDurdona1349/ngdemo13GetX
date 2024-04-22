import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/post_model.dart';
import '../models/post_res_model.dart';
import '../service/http_service.dart';
import '../service/log_service.dart';

class CreatController extends GetxController{
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  creatPost() async{
    String title = titleController.text.toString().trim();
    String body = bodyController.text.toString().trim();

    Post post = Post(userId: 1,title: title, body: body);

    var response = await Network.POST(Network.API_POST_CREATE, Network.paramsCreate(post));
    LogService.d(response!);
    PostRes postRes = Network.parsePostRes(response);
    backToFinish();
  }

  backToFinish(){
    // Navigator.of(context).pop(true);
    Get.back(result:true);
  }

}
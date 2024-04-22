import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/post_model.dart';
import '../models/post_res_model.dart';
import '../service/http_service.dart';
import '../service/log_service.dart';

class UpdateController extends GetxController{

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  updatePost() async{
    String title = titleController.text.toString().trim();
    String body = bodyController.text.toString().trim();


    Post newPost= Post(userId: 1,title: title, body: body);
    // newPost.title=title;
    // newPost.body=body;

    var response = await Network.PUT(Network.API_POST_UPDATE + newPost.id.toString(),
        Network.paramsUpdate(newPost));
    LogService.d(response!);
    PostRes postRes=Network.parsePostRes(response);
    backToFinish();
  }

  backToFinish(){
    Get.back(result:true);
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/services/log_service.dart';
import '../../../../../data/datasources/http_service.dart';
import '../../../../../data/models/post_model.dart';


class CreateController extends GetxController{
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  List<PostModel> posts = [];
  bool isLoading = false;

  creatPost() async{
    String title = titleController.text.toString().trim();
    String body = bodyController.text.toString().trim();
    isLoading = true;

    PostModel post = PostModel(userId: 1,title: title, body: body);

    var response = await Network.POST(Network.API_POST_CREATE, Network.paramsCreate(post));
    LogService.d(response!);
    // PostRes postRes = Network.parsePostRes(response);
    backToFinish();
    isLoading = false;
  }



  backToFinish(){
    // Navigator.of(context).pop(true);
    Get.back(result:true);

  }

}
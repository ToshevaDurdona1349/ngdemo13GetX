import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/update_controller.dart';
import '../models/post_model.dart';
import '../models/post_res_model.dart';
import '../service/http_service.dart';
import '../service/log_service.dart';

class UpdatePage extends StatefulWidget {
  final Post post;
  const UpdatePage({super.key,required this.post});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final _controller = Get.find<UpdateController>();


  @override
  void initState() {
    super.initState();
    _controller.titleController.text=widget.post.title!;
    _controller.bodyController.text=widget.post.body!;
  }

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    // keyvord ekran hohlagan joyini bossa yo'qolad
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Update Post"),
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: TextField(
                  controller: _controller.titleController,
                  decoration: InputDecoration(
                      hintText: "Title"
                  ),
                ),
              ),
              Container(
                child: TextField(
                  controller: _controller.bodyController,
                  decoration: InputDecoration(
                      hintText: "Body"
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () {
                      _controller.updatePost();
                    },
                    child: Text("Update"),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

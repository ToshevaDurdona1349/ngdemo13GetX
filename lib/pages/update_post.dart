import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controllers/update_controller.dart';
import '../models/post_model.dart';


class UpdatePage extends StatefulWidget {
  final Post post;

   UpdatePage({super.key,required this.post});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final UpdateController updatecontroller = Get.find<UpdateController>();


  @override
  void initState() {
    super.initState();
    updatecontroller.titleController.text=widget.post.title!;
    updatecontroller.bodyController.text=widget.post.body!;
  }

  @override
  Widget build(BuildContext context) {
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
                  controller: updatecontroller.titleController,
                  decoration: InputDecoration(
                      hintText: "Title"
                  ),
                ),
              ),
              Container(
                child: TextField(
                  controller:updatecontroller.bodyController,
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
                      updatecontroller.updatePost();
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

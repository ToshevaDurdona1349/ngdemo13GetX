import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../getx/controllers/create_controller.dart';


class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _creatController = Get.find<CreateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Create Post"),
      ),
      body: GetBuilder<CreateController>(
        builder: (controller) {
          return Stack(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      child: TextField(
                        controller: _creatController.titleController,
                        decoration: InputDecoration(
                          hintText: "Title",
                        ),
                      ),
                    ),
                    Container(
                      child: TextField(
                        controller: _creatController.bodyController,
                        decoration: InputDecoration(
                          hintText: "Body",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: double.infinity,
                      child: MaterialButton(
                        color: Colors.blue,
                        onPressed: () {
                          _creatController.creatPost();
                        },
                        child: Text("Create"),
                      ),
                    ),
                  ],
                ),
              ),
              _creatController.isLoading
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}

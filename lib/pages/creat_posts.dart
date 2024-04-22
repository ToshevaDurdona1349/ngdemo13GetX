import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../controllers/creat_controller.dart';
import '../controllers/home_controller.dart';

class CreatPage extends StatefulWidget {
  const CreatPage({super.key});

  @override
  State<CreatPage> createState() => _CreatPageState();
}

class _CreatPageState extends State<CreatPage> {
  final _controller = Get.find<CreatController>();

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Creat Post"),
      ),
      body: GetBuilder<CreatController>(
        builder: (controller) {
          return Container(
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
                        _controller.creatPost();
                      },
                      child: Text("Creat"),
                    )
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
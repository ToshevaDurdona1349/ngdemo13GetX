import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../controllers/home_controller.dart';
import '../views/itim_of_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    _controller.loadPosts();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Networking"),
      ),
      body: GetBuilder<HomeController>(
       builder: (controller){
         return Stack(
           children: [
             RefreshIndicator(
               onRefresh: _controller.handleRefresh,
               child: ListView.builder(
                 itemCount: _controller.posts.length,
                 itemBuilder: (ctx, index) {
                   return itemOfPost(_controller.posts[index]);
                 },
               ),
             ),
             _controller.isLoading
                 ? Center(
               child: CircularProgressIndicator(),
             )
                 : SizedBox.shrink(),
           ],
         );
       }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          _controller.callCreatePage();
        },
      ),
    );
  }


}
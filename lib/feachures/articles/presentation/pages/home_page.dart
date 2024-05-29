import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/controllers/home_controller.dart';
import '../widgets/itim_of_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    homeController.loadPosts();
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
               onRefresh: homeController.handleRefresh,
               child: ListView.builder(
                 itemCount: homeController.posts.length,
                 itemBuilder: (ctx, index) {
                   return itemOfPost(homeController.posts[index],homeController);
                 },
               ),
             ),
             homeController.isLoading
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
          homeController.callCreatePage();
        },
      ),
    );
  }


}
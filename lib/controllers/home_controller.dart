
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../models/post_model.dart';
import '../pages/creat_posts.dart';
import '../pages/update_post.dart';
import '../service/http_service.dart';
import '../service/log_service.dart';

class HomeController extends  GetxController{
  var data = Get.arguments;

  bool isLoading = true;
  List<Post> posts = [];

  loadPosts() async {
    isLoading = true;
    update();

    var response = await Network.GET(Network.API_POST_LIST, Network.paramsEmpty());
    LogService.d(response!);
    List<Post> postList = Network.parsePostList(response);

    posts = postList;
    isLoading = false;
    update();
  }

  deletePost(Post post) async {
    isLoading = true;
    update();

    var response = await Network.DEL(Network.API_POST_DELETE + post.id.toString(), Network.paramsEmpty());
    LogService.d(response!);
    loadPosts();
  }

  Future callCreatePage() async {
    // bool result = await Navigator.of(context )
    //     .push(MaterialPageRoute(builder: (BuildContext context) {
    //   return CreatPage();
    // }));
    bool result = await Get.to(CreatPage());
    if (result) {
      loadPosts();
    }
  }

  Future callUpdatePage(Post post) async {
    // bool result = await Navigator.of(context )
    //     .push(MaterialPageRoute(builder: (BuildContext context) {
    //   return UpdatePage(post: post);
    // }));
    bool result = await Get.to(UpdatePage(post: post));
    if (result) {
      loadPosts();
    }
  }
  Future<void> handleRefresh() async {
    loadPosts();
  }
}
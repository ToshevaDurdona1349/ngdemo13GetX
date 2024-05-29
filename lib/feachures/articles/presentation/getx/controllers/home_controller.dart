
import 'package:get/get.dart';
import '../../../../../core/services/log_service.dart';
import '../../../../../data/datasources/http_service.dart';
import '../../../../../data/models/post_model.dart';
import '../../../../../data/repositories/repositoties_impl.dart';
import '../../../../../domein/usecases/usecase.dart';
import '../../pages/create_page.dart';
import '../../pages/update_page.dart';



class HomeController extends  GetxController{
  var data = Get.arguments;

  bool isLoading = true;
  List<PostModel> posts = [];
  PostsUseCase postsUseCase = PostsUseCase(PostRepositoryImpl());

  loadPosts() async {
    isLoading = true;
    update();

    var response = await Network.GET(Network.API_POST_LIST, Network.paramsEmpty());
    LogService.d(response!);
    List<PostModel> postList = Network.parsePostList(response);

    posts = postList;
    isLoading = false;
    update();
  }

  deletePost(PostModel post) async {
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
    bool result = await Get.to(CreatePage());
    if (result) {
      loadPosts();
    }
  }

  Future callUpdatePage(PostModel post) async {
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
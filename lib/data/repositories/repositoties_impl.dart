
import '../../core/services/log_service.dart';
import '../../domein/entities/post_entity.dart';
import '../../domein/repositories/repository.dart';
import '../datasources/http_service.dart';


class PostRepositoryImpl extends PostRepository {
  @override
  Future<List<PostEntity>> loadPosts() async {
    var response = await Network.GET(Network.API_POST_LIST, Network.paramsEmpty());
    var postList = Network.parsePostList(response!);
    return postList;
  }

  @override
  Future<void> deletePost(PostEntity post) async {
    var response = await Network.DEL(Network.API_POST_DELETE + post.id.toString(), Network.paramsEmpty());
    LogService.d(response!);
    loadPosts();
  }

  @override
  Future<void> createPost(PostEntity post) async {
    var response = await Network.POST(Network.API_POST_CREATE, Network.paramsCreate(post));
    LogService.d(response!);
  }

  @override
  Future<void> updatePost(PostEntity newPost) async {
    var response = await Network.PUT(
        Network.API_POST_UPDATE + newPost.id.toString(),
        Network.paramsUpdate(newPost));
    LogService.d(response!);
  }
}
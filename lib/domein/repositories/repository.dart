
import '../entities/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> loadPosts() async {
    return [];
  }

  deletePost(PostEntity post) async {}

  createPost(PostEntity post) async {}

  updatePost(PostEntity post) async {}
}
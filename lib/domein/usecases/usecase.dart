
import '../entities/post_entity.dart';
import '../repositories/repository.dart';

class PostsUseCase{
  final PostRepository repository;

  PostsUseCase(this.repository);

  Future<List<PostEntity>> call() async {
    return await repository.loadPosts();
  }

  Future<void> delete(PostEntity post) async {
    await repository.deletePost(post);
  }

  Future<void> create(PostEntity post) async {
    await repository.createPost(post);
  }

  Future<void> update(PostEntity post) async {
    await repository.createPost(post);
  }
}
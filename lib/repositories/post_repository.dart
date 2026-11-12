import '../models/post.dart';
/// Interface repository untuk mengelola data Post.
abstract class PostRepository {
  /// Mengambil seluruh data Post.
  Future<List<Post>> getPosts();
}

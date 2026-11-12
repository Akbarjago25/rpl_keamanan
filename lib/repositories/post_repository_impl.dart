import '../models/post.dart';
import '../services/api_service.dart';
import 'post_repository.dart';

/// Implementasi PostRepository menggunakan ApiService.
class PostRepositoryImpl implements PostRepository {
  final ApiService apiService;

  PostRepositoryImpl(this.apiService);

  @override
  Future<List<Post>> getPosts() {
    return apiService.getPosts();
  }
}

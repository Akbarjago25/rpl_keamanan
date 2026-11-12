import '../services/api_service.dart';
import '../repositories/user_repository.dart';
import '../repositories/user_repository_impl.dart';
import '../repositories/post_repository.dart';
import '../repositories/post_repository_impl.dart';

class DependencyInjector {
  // Singleton ApiService
  static final ApiService apiService = ApiService();

  // UserRepository
 static final UserRepository userRepository = UserRepositoryImpl(apiService: apiService);
  // PostRepository
  static final PostRepository postRepository = PostRepositoryImpl(apiService);
}

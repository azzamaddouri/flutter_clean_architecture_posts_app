import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/domain/repositories/posts_repository.dart';

import '../../../../core/error/failures.dart';
import '../entities/post_entity.dart';

class GetAllPostsUseCase {
  final PostsRepository repository;
  GetAllPostsUseCase(this.repository);
  //Callable function
  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getAllPosts();
  }
}

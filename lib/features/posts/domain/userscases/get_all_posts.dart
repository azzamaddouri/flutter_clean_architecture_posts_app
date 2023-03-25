import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/domain/repositories/posts_repository.dart';

import '../../../../core/strings/failures.dart';
import '../entities/post_entity.dart';

class GetAllPostsUserCase {
  final PostsRepository repository;
  GetAllPostsUserCase(this.repository);
  //Callable function
  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getAllPosts();
  }
}

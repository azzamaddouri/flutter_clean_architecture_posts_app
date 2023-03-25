import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/domain/repositories/posts_repository.dart';

import '../../../../core/strings/failures.dart';
import '../entities/post_entity.dart';

class UpdatePostUseCase {
  final PostsRepository repository;
  UpdatePostUseCase(this.repository);
  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.updatePost(post);
  }
}

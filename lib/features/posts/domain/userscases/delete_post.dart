import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/domain/repositories/posts_repository.dart';

import '../../../../core/strings/failures.dart';

class DeletePostUserCase {
  final PostsRepository repository;
  DeletePostUserCase(this.repository);
  Future<Either<Failure,Unit>> call(int postId)async{
return await repository.deletePost(postId);
  }
}

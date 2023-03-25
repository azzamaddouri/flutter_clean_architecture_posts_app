import 'package:flutter_clean_architecture_posts_app/core/strings/failures.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';
abstract class PostsRepository {
  Future<Either<Failure,List<Post>>> getAllPosts();
  Future<Either<Failure,Unit>> deletePost(int id);
  Future<Either<Failure,Unit>> updatePost(Post post);
  Future<Either<Failure,Unit>> addedPost(Post post);
}


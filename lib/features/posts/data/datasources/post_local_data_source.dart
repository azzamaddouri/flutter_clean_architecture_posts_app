import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/data/models/post_model.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postModels);
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  @override
  Future<Unit> cachePosts(List<PostModel> postModels) {
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    throw UnimplementedError();
  }
}

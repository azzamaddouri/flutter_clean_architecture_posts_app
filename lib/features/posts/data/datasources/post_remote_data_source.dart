import 'package:dartz/dartz.dart';

import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> deletePost(int idPost);
  Future<Unit> updatePost(PostModel postmodel);
  Future<Unit> addPost(PostModel posmodel);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  @override
  Future<Unit> addPost(PostModel posmodel) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost(int idPost) {
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getAllPosts() {
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePost(PostModel postmodel) {
    throw UnimplementedError();
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_posts_app/core/network/network_info.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/data/models/post_model.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/domain/entities/post_entity.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/posts_repository.dart';
import '../datasources/post_local_data_source.dart';

typedef Future<Unit> DeleteOrUpdateOrAddPost();

class PostsRepositoryImpl implements PostsRepository {
  final PostRemoteDataSource remoteDataSource;
  // This is from the local database
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  PostsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getAllPosts();
        //That's where I cash my data
        localDataSource.cachePosts(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedPosts();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    final PostModel postmodel = PostModel(title: post.title, body: post.body);
    return _getMessage(() => remoteDataSource.addPost(postmodel));
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async {
    return await _getMessage(() => remoteDataSource.deletePost(id));
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    final PostModel postmodel =
        PostModel(id: post.id, title: post.title, body: post.body);
    return await _getMessage(() => remoteDataSource.updatePost(postmodel));
  }

  Future<Either<Failure, Unit>> _getMessage(
      DeleteOrUpdateOrAddPost deleteOrUpdateOrAddPost) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddPost();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}

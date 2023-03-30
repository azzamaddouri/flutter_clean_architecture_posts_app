import 'package:flutter_clean_architecture_posts_app/core/network/network_info.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/data/repositories/post_repository_impl.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/domain/userscases/delete_post.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/domain/userscases/get_all_posts.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/domain/userscases/update_post.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/posts/data/datasources/post_local_data_source.dart';
import 'features/posts/domain/userscases/add_post.dart';

final sl = GetIt.instance;
Future<void> init() async {
// ! Features - posts

// Bloc : I can create multiple objects of each bloc
  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
  sl.registerFactory(() => AddDeleteUpdatePostBloc(
      addPost: sl(), updatePost: sl(), deletePost: sl()));
// UserCases : I create one object for multiple uses aka singleton : lazy singleton creates an object when it is needed
  sl.registerLazySingleton(() => GetAllPostsUseCase(sl()));
  sl.registerLazySingleton(() => AddPostUseCase(sl()));
  sl.registerLazySingleton(() => DeletePostUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePostUseCase(sl()));
// Repository : We can't implement PostRepository cause it's an abstarct class so we implement a class that implements PostRepository
  sl.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
// Datasources
  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl(sharedPreferences: sl()));
// ! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

// ! External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}

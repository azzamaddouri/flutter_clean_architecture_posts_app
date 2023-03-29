import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_posts_app/core/network/network_info.dart';
import 'package:flutter_clean_architecture_posts_app/core/theme/app_theme.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/data/datasources/post_local_data_source.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/data/repositories/post_repository_impl.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/domain/userscases/add_post.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/domain/userscases/delete_post.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/domain/userscases/get_all_posts.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/domain/userscases/update_post.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/posts/presentation/bloc/posts/posts_bloc.dart';

void main() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  const MyApp({super.key, required this.sharedPreferences});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PostsBloc(
                getAllPosts: GetAllPostsUseCase(PostsRepositoryImpl(
              localDataSource:
                  PostLocalDataSourceImpl(sharedPreferences: sharedPreferences),
              remoteDataSource: PostRemoteDataSourceImpl(client: Client()),
              networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
            ))),
          ),
          BlocProvider(
            create: (context) => AddDeleteUpdatePostBloc(
                addPost: AddPostUseCase(PostsRepositoryImpl(
                  localDataSource: PostLocalDataSourceImpl(
                      sharedPreferences: sharedPreferences),
                  remoteDataSource: PostRemoteDataSourceImpl(client: Client()),
                  networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
                )),
                updatePost: UpdatePostUseCase(PostsRepositoryImpl(
                  localDataSource: PostLocalDataSourceImpl(
                      sharedPreferences: sharedPreferences),
                  remoteDataSource: PostRemoteDataSourceImpl(client: Client()),
                  networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
                )),
                deletePost: DeletePostUserCase(PostsRepositoryImpl(
                  localDataSource: PostLocalDataSourceImpl(
                      sharedPreferences: sharedPreferences),
                  remoteDataSource: PostRemoteDataSourceImpl(client: Client()),
                  networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
                ))),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            home: Scaffold(appBar: AppBar())));
  }
}

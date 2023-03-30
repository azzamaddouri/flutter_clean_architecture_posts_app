import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_posts_app/core/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'features/posts/presentation/pages/posts_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  /*  SharedPreferences sharedPreferences = await SharedPreferences.getInstance(); */
  runApp(MyApp(/* sharedPreferences: sharedPreferences */));
}

class MyApp extends StatelessWidget {
  /*  final SharedPreferences sharedPreferences; */
 /*  const MyApp({
    super.key,
    /* required this.sharedPreferences */
  }); */

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => di.sl<PostsBloc>()
                ..add(GetAllPostsEvent() /* Start the app with an event  */)),
          BlocProvider(create: (_) => di.sl<AddDeleteUpdatePostBloc>())
          /* It's correct but not clean : BlocProvider(
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
                deletePost: DeletePostUseCase(PostsRepositoryImpl(
                  localDataSource: PostLocalDataSourceImpl(
                      sharedPreferences: sharedPreferences),
                  remoteDataSource: PostRemoteDataSourceImpl(client: Client()),
                  networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
                ))),
          ), */
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            title: 'Posts App',
            home: PostsPage()));
  }
}

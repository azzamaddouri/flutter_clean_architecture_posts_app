import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_posts_app/core/theme/app_theme.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/domain/userscases/get_all_posts.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/posts/presentation/bloc/posts/posts_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PostsBloc(getAllPosts: GetAllPostsUseCase()),
          ),
          BlocProvider(
            create: (context) => AddDeleteUpdatePostBloc(addPost: addPost, updatePost: updatePost, deletePost: deletePost),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            home: Scaffold(appBar: AppBar())));
  }
}

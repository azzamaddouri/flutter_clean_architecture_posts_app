import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/presentation/bloc/posts/posts_bloc.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../widgets/message_display_widget.dart';
import '../widgets/post_list_widget.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() => AppBar(title: Text("Posts"));
  Widget _buildBody() {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder(builder: ((context, state) {
          if (state is LoadingPostsState) { //LoadingWidget is used by many features that's why it's implemented in the core folder
            return LoadingWidget();
          } else if (state is LoadedPostsState) {
            return PostListWidget(posts: state.posts);
          } else if (state is ErrorPostsState) {
            return MessageDisplayWidget(message: state.message);
          }
          return LoadingWidget();
        })));
  }
}

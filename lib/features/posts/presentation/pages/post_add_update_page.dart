// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_posts_app/core/util/snackbar_message.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/presentation/pages/posts_page.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../domain/entities/post_entity.dart';
import '../widgets/post_add_update_page/form_widget.dart';

class PostAddUpdatePage extends StatelessWidget {
  final Post? post;
  final bool isUpdatePost;
  const PostAddUpdatePage({
    Key? key,
    this.post,
    required this.isUpdatePost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(title: Text(isUpdatePost ? "EditPost" : "Add Post"));
  }

  Widget _buildBody() {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child:
                BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
              listener: (context, state) {
                if (state is MessageAddDeleteUpdatePostState) {
                  SnackBarMessage().showSuccessSnackBar(
                      message: state.message, context: context);
                  // Navigator.of(context).push() is used when you don't have a BuildContext available directly, but you can get one through some other means
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => PostsPage()),
                      (route) => false);
                } else if (state is ErrorAddDeleteUpdatePostState) {
                  SnackBarMessage().showErrorSnackBar(
                      message: state.message, context: context);
                }
              },
              builder: (context, state) {
                if (state is LoadingAddDeleteUpdatePostState) {
                  return LoadingWidget();
                }
                return FormWidget(
                    isUpdatePost: isUpdatePost,
                    post: isUpdatePost ? post : null);
              },
            )));
  }
}

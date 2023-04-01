// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_clean_architecture_posts_app/features/posts/presentation/widgets/post_datail_page/delete_post_btn.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/presentation/widgets/post_datail_page/update_post_btn_widget.dart';

import '../../../domain/entities/post_entity.dart';

class PageDetailWidget extends StatelessWidget {
  final Post post;
  const PageDetailWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            post.title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Divider(height: 50),
          Text(
            post.body,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Divider(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UpdatePostBtnWidget(post: post),
              DeletePostBtnWidget(postId: post.id!),
            ],
          )
        ],
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/presentation/pages/post_add_update_page.dart';

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
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => PostAddUpdatePage(
                                isUpdatePost: true, post: post)));
                  },
                  icon: Icon(Icons.edit),
                  label: Text("Edit"))
            ],
          )
        ],
      ),
    );
  }
}

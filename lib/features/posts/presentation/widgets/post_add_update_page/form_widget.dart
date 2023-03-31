// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../domain/entities/post_entity.dart';

class FormWidget extends StatefulWidget {
  final bool isUpdatePost;
  final Post? post;
  const FormWidget({
    Key? key,
    required this.isUpdatePost,
    this.post,
  }) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  //Use a key to identify the state of the form widget
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  @override
  void initState() {
    if (widget.isUpdatePost) {
      _titleController.text = widget.post!.title;
      _bodyController.text = widget.post!.body;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                controller: _titleController,
                validator: (value) =>
                    value!.isEmpty ? "Title can't be empty" : null,
                decoration: InputDecoration(hintText: "Title"),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                controller: _bodyController,
                validator: (value) =>
                    value!.isEmpty ? "Body can't be empty" : null,
                decoration: InputDecoration(hintText: "Body"),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: widget.isUpdatePost ? Icon(Icons.edit) : Icon(Icons.add),
              label: Text(
                widget.isUpdatePost ? "Update" : "Add",
              ),
            )
          ],
        ));
  }
}

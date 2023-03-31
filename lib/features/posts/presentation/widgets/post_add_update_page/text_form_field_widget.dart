// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  final bool multiLines;

  TextFormFieldWidget({
    Key? key,
    required this.name,
    required this.controller,
    required this.multiLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        controller: controller,
        validator: (value) => value!.isEmpty ? "$name can't be empty" : null,
        decoration: InputDecoration(hintText: name),
        minLines: multiLines? 6:1,
        maxLines: multiLines ?6:1,
      ),
    );
  }
}

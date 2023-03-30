// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MessageDisplayWidget extends StatelessWidget {
  const MessageDisplayWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: /*  sets the height of a widget to one-third of the height of the device's screen. */
          MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
            child: Text(message,
                style: const TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center)),
      ),
    );
  }
}

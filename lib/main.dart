import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_posts_app/core/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,theme: appTheme, home: Scaffold(appBar: AppBar()));
  }
}

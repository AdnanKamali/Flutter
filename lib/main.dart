import 'package:first/about_me.dart';
import 'package:first/my_home_page.dart';
import 'package:flutter/material.dart';
import 'my_use_colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"AboutMe": (context) => const AboutMeScreen()},
      theme: ThemeData(scaffoldBackgroundColor: bgScreenColor),
      home: const Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rick_and_morty/theme/my_colors.dart';
import 'my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MyMaterialColor.myColor,
      ),
      home: const MyHomePage(),
    );
  }
}

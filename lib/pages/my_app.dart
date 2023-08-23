import 'package:flutter/material.dart';
import 'package:rick_and_morty/routes/routes.dart';
import 'package:rick_and_morty/theme/my_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: MyMaterialColor.myColor, fontFamily: 'Jolly Lodger'),
      initialRoute: '/',
      routes: routes,
    );
  }
}

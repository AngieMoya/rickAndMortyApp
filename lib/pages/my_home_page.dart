import 'package:flutter/material.dart';
import 'package:rick_and_morty/widgets/about_rickandmorty.dart';
import 'package:rick_and_morty/widgets/my_appbar.dart';
import 'package:rick_and_morty/widgets/my_header.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(),
      body: ListView(children: const [ MyHeader(), AboutRickAndMorty() ]),
    );
  }
}

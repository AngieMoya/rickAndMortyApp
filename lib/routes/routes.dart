import 'package:flutter/material.dart';
import 'package:rick_and_morty/pages/characters_page.dart';
import 'package:rick_and_morty/pages/episodes_page.dart';
import 'package:rick_and_morty/pages/locations_page.dart';
import 'package:rick_and_morty/pages/my_home_page.dart';

Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => const MyHomePage(),
  '/characters':(BuildContext context) => const CharactersPage(),
  '/episodes':(BuildContext context) => const EpisodesPage(),
  '/locations':(BuildContext context) => const LocationsPage(),
};

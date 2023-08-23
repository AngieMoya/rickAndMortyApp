import 'package:flutter/material.dart';

void navigator(BuildContext context, String route) {
  Navigator.of(context).pushNamed(route);
}
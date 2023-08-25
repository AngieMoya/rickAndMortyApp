import 'package:flutter/material.dart';
import 'package:rick_and_morty/widgets/info_header_home.dart';

class MyHeader extends StatelessWidget implements PreferredSizeWidget {
  const MyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 240,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/rick_and_morty/header.jpeg'),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
        ),
      ),
      child: const InfoHeaderHome(),
    );
  }

  @override
  Size get preferredSize => const Size(240, 240);
}

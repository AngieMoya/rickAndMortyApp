import 'package:flutter/material.dart';
import 'package:rick_and_morty/widgets/character/search_character.dart';

class MyHeaderCharacter extends StatelessWidget implements PreferredSizeWidget {
  const MyHeaderCharacter({super.key});

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 30, top: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Personajes',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          SearchCharacters()
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(240, 240);
}

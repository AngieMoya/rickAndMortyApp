import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset('../../assets/images/rick_and_morty/logo.png'),
      actions: [
        PopupMenuButton(
          icon: const Icon(Icons.menu),
          onSelected: (value) => navigation(value),
          itemBuilder: (context) => [
            const PopupMenuItem(
              child: Text('Contenido'),
              value: '',
            ),
            const PopupMenuItem(
              child: Text('Personajes'),
              value: '/characters',
            ),
            const PopupMenuItem(
              child: Text('Episodios'),
              value: '/episodes',
            ),
            const PopupMenuItem(
              child: Text('Escenarios'),
              value: '/locations',
            )
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(120, 80);

  navigation(String value) {}
}

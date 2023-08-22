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
          itemBuilder: (context) => [
            const PopupMenuItem(child: Text('Contenido')),
            const PopupMenuItem(child: Text('Personajes')),
            const PopupMenuItem(child: Text('Episodios')),
            const PopupMenuItem(child: Text('Escenarios'))
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(120, 80);
}

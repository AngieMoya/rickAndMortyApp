import 'package:flutter/material.dart';
import 'package:rick_and_morty/utils/navigation.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {

    void navigation(String value) {
      navigator(context, value);
    }


    return AppBar(
      title: Image.asset('../../assets/images/rick_and_morty/logo.png'),
      actions: [
        PopupMenuButton(
          icon: const Icon(Icons.menu),
          onSelected: (value) => navigation(value),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: '',
              child: Text('Contenido'),
            ),
            const PopupMenuItem(
              value: '/characters',
              child: Text('Personajes'),
            ),
            const PopupMenuItem(
              value: '/episodes',
              child: Text('Episodios'),
            ),
            const PopupMenuItem(
              value: '/locations',
              child: Text('Escenarios'),
            )
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(120, 80);

}

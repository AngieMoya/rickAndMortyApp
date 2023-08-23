import 'package:flutter/material.dart';
import 'package:rick_and_morty/theme/my_colors.dart';
import 'package:rick_and_morty/utils/navigation.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    void navigation(String value) {
      navigator(context, value);
    }

    return AppBar(
      backgroundColor: MyMaterialColor.mySecondColor,
      title: Image.asset(
        'assets/images/rick_and_morty/logo.png',
        width: 50,
        //height: 80,
      ),
      actions: [
        PopupMenuButton(
          color: MyMaterialColor.myColor.withAlpha(99),
          icon: const Icon(
            Icons.menu,
            color: MyMaterialColor.myColor,
          ),
          onSelected: (value) => navigation(value),
          itemBuilder: (context) => [
            PopupMenuItem(
              enabled: false,
              value: '',
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      'Contenido',
                      style: TextStyle(
                        fontSize: 16,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = MyMaterialColor.mySecondColor,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Contenido',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuItem(
              value: '/characters',
              child: Stack(
                children: [
                  Text(
                    'Personajes',
                    style: TextStyle(
                      fontSize: 16,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = MyMaterialColor.mySecondColor,
                    ),
                  ),
                  const Text(
                    'Personajes',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuItem(
              value: '/episodes',
              child: Stack(
                children: [
                  Text(
                    'Episodios',
                    style: TextStyle(
                      fontSize: 16,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = MyMaterialColor.mySecondColor,
                    ),
                  ),
                  const Text(
                    'Episodios',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuItem(
              value: '/locations',
              child: Stack(
                children: [
                  Text(
                    'Escenarios',
                    style: TextStyle(
                      fontSize: 16,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = MyMaterialColor.mySecondColor,
                    ),
                  ),
                  const Text(
                    'Escenarios',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(120, 60);
}

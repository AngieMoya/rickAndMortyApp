import 'package:flutter/material.dart';

class InfoHeaderHome extends StatelessWidget {
  const InfoHeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Personajes',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Text(
              '826',
              style: TextStyle(color: Colors.white, fontSize: 24),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lugares',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Text(
              '126',
              style: TextStyle(color: Colors.white, fontSize: 24),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Episodios',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Text(
              '351',
              style: TextStyle(color: Colors.white, fontSize: 24),
            )
          ],
        )
      ],
    );
  }
}

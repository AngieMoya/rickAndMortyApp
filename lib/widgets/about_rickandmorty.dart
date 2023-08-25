import 'package:flutter/material.dart';
import 'package:rick_and_morty/theme/my_colors.dart';

class AboutRickAndMorty extends StatelessWidget {
  const AboutRickAndMorty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(36),
            width: 320,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                border: Border.all(color: MyMaterialColor.myColor, width: 3),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 32, top: 20),
                  child: Stack(
                    children: [
                      Text(
                        'Rick and Morty',
                        style: TextStyle(
                          fontSize: 32,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 4
                            ..color = MyMaterialColor.mySecondColor,
                        ),
                      ),
                      const Text(
                        'Rick and Morty',
                        style: TextStyle(
                          fontSize: 32,
                          color: MyMaterialColor.myColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  'La serie sigue las desventuras del cínico científico loco Rick Sánchez y su inquieto y fácilmente influyente nieto Morty Smith, que dividió su tiempo entre la vida doméstica y las aventuras interdimensionales.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Inder',
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 28, top: 28),
                  child: Stack(
                    children: [
                      Text(
                        'Resumen',
                        style: TextStyle(
                          fontSize: 28,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 4
                            ..color = MyMaterialColor.mySecondColor,
                        ),
                      ),
                      const Text(
                        'Resumen',
                        style: TextStyle(
                          fontSize: 28,
                          color: MyMaterialColor.myColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Después de desaparecer durante casi 20 años, Rick Sánchez llega repentinamente a la puerta de su hija Beth en busca de mudarse con ella y su familia. Rick convierte el garaje en su laboratorio personal y se pone a trabajar en todo tipo de artilugios de ciencia ficción peligrosos. Rick involucra a sus nietos Morty y Summer en sus locas aventuras.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontFamily: 'Inder', fontSize: 16),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/rick_and_morty/sticker.png',
            width: 120,
          )
        ],
      ),
    );
  }
}

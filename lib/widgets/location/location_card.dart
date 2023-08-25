import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/location_model.dart';
import 'package:rick_and_morty/theme/my_colors.dart';

class LocationCard extends StatelessWidget {
  final LocationModel character;

  const LocationCard({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 44, right: 44, top: 3, bottom: 3),
      child: Card(
        color: MyMaterialColor.myColor[300],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(character.name, style: const TextStyle(fontSize: 24),),
              const SizedBox(height: 10,),
              myText('Tipo: ', character.type),
              const SizedBox(height: 10,),
              myText('Dimension: ', character.dimension),
              const SizedBox(height: 10,),
              myText('Residentes: ', character.residents.length.toString()),
            ],
          ),
        ),
      ),
    );
  }

  RichText myText(String key, String value) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 16, fontFamily: 'Inder', color: Colors.black),
        children: [
          TextSpan(text: key, style: const TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: value),
        ]
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/location_model.dart';

class LocationCard extends StatelessWidget {
  final LocationModel character;

  const LocationCard({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(character.dimension),
          Text(character.name),
        ],
      ),
    );
  }
}


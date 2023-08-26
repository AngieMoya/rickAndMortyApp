import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character_model.dart';

class CharacterCard extends StatelessWidget {
  final CharacterModel character;

  const CharacterCard({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 44, right: 44, top: 20, bottom: 3),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 5,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    character.image,
                    width: 200,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  character.name,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      color: character.status == 'unknown'
                          ? Colors.blueGrey
                          : character.status == 'Alive'
                              ? Colors.green
                              : Colors.red,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${character.status} - ${character.species}',
                      style: const TextStyle(fontSize: 16, fontFamily: 'Inder'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

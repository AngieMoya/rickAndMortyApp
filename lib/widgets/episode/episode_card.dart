import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/episode_model.dart';

class EpisodeCard extends StatelessWidget {
  final EpisodeModel character;

  const EpisodeCard({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(character.episode),
          Text(character.name),
        ],
      ),
    );
  }
}

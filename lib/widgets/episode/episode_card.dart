import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/episode_model.dart';
import 'package:rick_and_morty/theme/my_colors.dart';

class EpisodeCard extends StatelessWidget {
  final EpisodeModel episode;

  String getSeason(String code) {
    int index = code.indexOf('E');
    String season = code.substring(1, index);
    return season;
  }

  String getChapter(String code) {
    int index = code.indexOf('E');
    String chapter = code.substring(index + 1, code.length);
    return chapter;
  }

  const EpisodeCard({
    super.key,
    required this.episode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 44, right: 44, top: 20, bottom: 3),
      child: Card(
        shadowColor: MyMaterialColor.myColor,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                episode.name,
                style: const TextStyle(
                    fontSize: 24,
                    color: MyMaterialColor.myColor,
                    fontFamily: 'Inder',
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              myText('Capitulo: ', getChapter(episode.episode)),
              const SizedBox(
                height: 10,
              ),
              myText('Temporada: ', getSeason(episode.episode)),
              const SizedBox(
                height: 10,
              ),
              myText('Personajes: ', episode.characters.length.toString()),
            ],
          ),
        ),
      ),
    );
  }

  RichText myText(String key, String value) {
    return RichText(
      text: TextSpan(
          style: const TextStyle(
              fontSize: 16, fontFamily: 'Inder', color: Colors.black),
          children: [
            TextSpan(
                text: key, style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: value),
          ]),
    );
  }
}

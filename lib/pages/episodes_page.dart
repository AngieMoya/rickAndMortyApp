import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/episode_model.dart';
import 'package:rick_and_morty/providers/episode_provider.dart';

class EpisodesPage extends StatefulWidget {
  const EpisodesPage({super.key});

  @override
  State<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
  late Future<List<EpisodeModel>> episodes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
      ),
      body: FutureBuilder(
          future: episodes,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return EpisodeBody(
                    character: snapshot.data![index],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Text('Error');
            }

            return const Center(child: CircularProgressIndicator());
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    episodes = EpisodePrivoder().getAll();
  }
}

class EpisodeBody extends StatelessWidget {
  final EpisodeModel character;

  const EpisodeBody({
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

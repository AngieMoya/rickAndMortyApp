import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/episode_model.dart';
import 'package:rick_and_morty/providers/episode_provider.dart';
import 'package:rick_and_morty/widgets/episode/episode_card.dart';
import 'package:rick_and_morty/widgets/my_appbar.dart';
import 'package:rick_and_morty/widgets/my_header.dart';

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
      appBar: const MyAppbar(),
      body: Column(
        children: [
          const MyHeader(),
          FutureBuilder(
              future: episodes,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height - 345,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return EpisodeCard(
                          character: snapshot.data![index],
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Text('Error');
                }

                return const Center(child: CircularProgressIndicator());
              }),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    episodes = EpisodePrivoder().getAll();
  }
}

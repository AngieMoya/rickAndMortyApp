import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/episode_model.dart';
import 'package:rick_and_morty/providers/episode_provider.dart';
import 'package:rick_and_morty/widgets/episode/episode_card.dart';
import 'package:rick_and_morty/widgets/episode/header_episode.dart';
import 'package:rick_and_morty/widgets/my_appbar.dart';

class EpisodesPage extends StatefulWidget {
  const EpisodesPage({super.key});

  @override
  State<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {

  late ScrollController _scrollController;
  final List<EpisodeModel> _episodes = [];
  
  final int _maxLength = 51;
  int page = 1;
  bool isLoading = false;
  bool hasMore = true;

  _getEpisodes() async{
    setState(() {
      isLoading = true;
    });

    final episodes = await EpisodePrivoder().getAll(page);
    for (var episode in episodes) {
      _episodes.add(episode);
    }

    setState(() {
      isLoading = false;
      page += 1;
      hasMore = _episodes.length < _maxLength;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(),
      body: Column(
        children: [
          const MyHeaderEpisodes(),
          SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 345,
              child: ListView.separated(
                controller: _scrollController,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: _episodes.length,
                itemBuilder: (context, index) {
                  return EpisodeCard(
                    episode: _episodes[index],
                  );
                },
              ),
            )
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getEpisodes();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !isLoading) {
        if (hasMore) {
          _getEpisodes();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

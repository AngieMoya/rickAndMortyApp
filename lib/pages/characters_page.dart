import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/providers/character_provider.dart';
import 'package:rick_and_morty/widgets/character/character_card.dart';
import 'package:rick_and_morty/widgets/my_appbar.dart';
import 'package:rick_and_morty/widgets/my_header.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {

  late ScrollController _scrollController;
  final List<CharacterModel> _characters = [];
  final int _maxLength = 826;
  int page = 1;
  bool isLoading = false;
  bool hasMore = true;

  _getCharacters() async{
    setState(() {
      isLoading = true;
    });
    final characters = await CharacterPrivoder().getAll(page);
    for (var character in characters) {
      _characters.add(character);
    }
    setState(() {
      isLoading = false;
      page += 1;
      hasMore = _characters.length < _maxLength;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(),
      body: Column(
        children: [
          const MyHeader(),
          SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 345,
              child: ListView.separated(
                controller: _scrollController,
                separatorBuilder: (context, index) => const SizedBox( height: 10 ),
                itemCount: _characters.length,
                itemBuilder: (context, index) {
                  if (index == _characters.length) {
                    return const SizedBox(
                      width: 60,
                      height: 60,
                      child: FittedBox(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return CharacterCard(
                    character: _characters[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getCharacters();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && !isLoading) {
        if (hasMore) {
          _getCharacters();
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


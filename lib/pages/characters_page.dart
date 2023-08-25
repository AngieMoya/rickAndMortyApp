import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/providers/character_provider.dart';
import 'package:rick_and_morty/widgets/my_appbar.dart';
import 'package:rick_and_morty/widgets/my_header.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late Future<List<CharacterModel>> characters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(),
      body: FutureBuilder(
          future: characters,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return CharacterBody(
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
    characters = CharacterPrivoder().getAll();
  }
}

class CharacterBody extends StatelessWidget {
  final CharacterModel character;

  const CharacterBody({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 44, right: 44, top: 3, bottom: 3),
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
              )
            ],
          ),
        ));
  }
}

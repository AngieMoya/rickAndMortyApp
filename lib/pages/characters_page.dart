import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/providers/character_provider.dart';
import 'package:rick_and_morty/widgets/my_appbar.dart';

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
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 10,), 
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index){
                return CharacterBody(character: snapshot.data![index],);
              }, 
            );
          }else if(snapshot.hasError){
            return const Text('Error');
          }

          return const Center(
            child: CircularProgressIndicator()
          );
        }
      ),
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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(character.image),
          Text(character.name),
        ],
      ),
    );
  }
}
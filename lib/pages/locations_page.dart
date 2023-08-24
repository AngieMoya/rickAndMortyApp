import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/location_model.dart';
import 'package:rick_and_morty/providers/location_provider.dart';
import 'package:rick_and_morty/widgets/my_appbar.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({super.key});

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
 late Future<List<LocationModel>> locations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(),
      body: FutureBuilder(
          future: locations,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return LocationBody(
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
    locations = LocationPrivoder().getAll();
  }

}

class LocationBody extends StatelessWidget {
  final LocationModel character;

  const LocationBody({
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


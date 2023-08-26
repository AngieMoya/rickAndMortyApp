import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/location_model.dart';
import 'package:rick_and_morty/providers/location_provider.dart';
import 'package:rick_and_morty/widgets/location/header_location.dart';
import 'package:rick_and_morty/widgets/location/location_card.dart';
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
      body: Column(
        children: [
          const MyHeaderLocations(),
          FutureBuilder(
              future: locations,
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
                        return LocationCard(
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
    locations = LocationPrivoder().getAll();
  }
}

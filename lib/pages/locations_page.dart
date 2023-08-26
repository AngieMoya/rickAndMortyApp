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

  late ScrollController _scrollController;
  final List<LocationModel> _locations = [];

  final int _maxLength = 126;
  bool isLoading = false;
  int page = 1;
  bool hasMore = true;

  _getLocations() async{
    setState(() {
      isLoading = true;
    });

    final locations = await LocationPrivoder().getAll(page);
    for(var location in locations){
      _locations.add(location);
    }

    setState(() {
      isLoading = false;
      page += 1;
      hasMore = _locations.length < _maxLength;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(),
      body: Column(
        children: [
          const MyHeaderLocations(),
          SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 345,
              child: ListView.separated(
                controller: _scrollController,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: _locations.length,
                itemBuilder: (context, index) {
                  return LocationCard(
                    character: _locations[index],
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
    _getLocations();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !isLoading) {
        if (hasMore) {
          _getLocations();
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

import 'package:flutter/material.dart';

import '../../theme/my_colors.dart';

class SearchCharacters extends StatefulWidget {
  SearchCharacters({super.key});

  @override
  State<SearchCharacters> createState() => _SearchCharactersState();
}

class _SearchCharactersState extends State<SearchCharacters> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 200,
          height: 54,
          decoration: BoxDecoration(
              color: const Color.fromARGB(40, 217, 217, 217),
              borderRadius: BorderRadius.circular(24)),
          child: TextField(
            onChanged: (value) {},
            controller: editingController,
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color.fromARGB(100, 217, 217, 217),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(
                      width: 0, color: Color.fromARGB(40, 217, 217, 217)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(
                      width: 0, color: Color.fromARGB(40, 217, 217, 217)),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                )),
          ),
        ),
        Container(
          width: 90,
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: MyMaterialColor.myColor.withAlpha(99),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24))),
              onPressed: () {},
              child: const Text(
                'Buscar',
                style: TextStyle(fontSize: 16, color: Colors.white),
              )),
        )
      ],
    );
  }
}

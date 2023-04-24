import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_morty/models/charcaterToList.dart';
import 'package:rick_morty/services/character_services.dart';
import 'package:rick_morty/widgets/products_card.dart';

class HomePageCharacters extends StatefulWidget {
  const HomePageCharacters({super.key});

  @override
  State<HomePageCharacters> createState() => _HomePageCharactersState();
}

class _HomePageCharactersState extends State<HomePageCharacters> {
  List<CharacterToList> chars = [];
  CharacterSevices get _service => GetIt.I<CharacterSevices>();

  @override
  void initState() {
    chars = _service.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Rick and morty characters!",
          style: TextStyle(
            color: Colors.cyan,
          ),
        ),
        centerTitle: true,
        elevation: 3,
        backgroundColor: Colors.white,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return CharcterCard(
            image: chars[index].image,
            name: chars[index].name,
            gender: chars[index].gender,
          );
        },
        separatorBuilder: (_, __) => const Divider(
          color: Colors.cyan,
          thickness: 1,
        ),
        itemCount: chars.length,
      ),
    );
  }
}

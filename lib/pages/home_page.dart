// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_morty/models/character.dart';
import 'package:rick_morty/models/charcaterToList.dart';
import 'package:rick_morty/pages/characters_details.dart';
import 'package:rick_morty/services/character_services.dart';
import 'package:rick_morty/widgets/products_card.dart';

class HomePageCharacters extends StatefulWidget {
  const HomePageCharacters({super.key});

  @override
  State<HomePageCharacters> createState() => _HomePageCharactersState();
}

class _HomePageCharactersState extends State<HomePageCharacters> {
  CharacterSevices get _service => GetIt.I<CharacterSevices>();
  List<Results>? _list = [];

  bool _isloading = false;
  @override
  void initState() {
    fetchCharacter();
    super.initState();
  }

  fetchCharacter() async {
    setState(() {
      _isloading = true;
    });
    _list = await _service.getcharactersList();

    setState(() {
      _isloading = false;
    });
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
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CharactersDetailsScreen(
                        characterId: _list![index].id! ,
                      ),
                    ),
                  ),
                  child: CharcterCard(
                    id: _list![index].id.toString(),
                    image: _list![index].image!,
                    name: _list![index].name!,
                    gender: _list![index].gender!,
                  ),
                );
              },
              separatorBuilder: (_, __) => const Divider(
                color: Colors.cyan,
                thickness: 1,
              ),
              itemCount: _list!.length,
            ),
    );
  }
}

// import 'package:http/http.dart' as http;
// import 'dart:convert';

import 'package:rick_morty/models/charcaterToList.dart';

class CharacterSevices {
  // Future getCharacterName() async {
  //   final data = http.get(Uri.parse("https://rickandmortyapi.com/api/character"));
  // }
  List<CharacterToList> newData = [];

  final data = [
    CharacterToList(
      name: "Rick",
      gender: "male",
      image: "assets/images/rick.jpg",
    ),
       CharacterToList(
      name: "morty",
      gender: "female",
      image: "assets/images/rick.jpg",
    ),
       CharacterToList(
      name: "Rick& morty",
      gender: "female and male",
      image: "assets/images/rick.jpg",
    ),
  ];
}

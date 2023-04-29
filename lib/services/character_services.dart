// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'package:rick_morty/config/api_constants.dart';
import 'package:rick_morty/models/character.dart';
import 'package:rick_morty/models/character_details.dart' as detail;
import 'dart:convert';

import 'package:rick_morty/models/charcaterToList.dart';

class CharacterSevices {
  List<CharacterToList> _items = [];
  List<CharacterToList> get items {
    return [..._items];
  }

  final String _baseUrl = ApiService.baseUrl;
  // Future<List<CharacterToList>> getCharactersData() async {
  // final data = await http.get(Uri.parse('$_baseUrl/character/?page=1'));

  // final jsonData = json.decode(data.body);
  // final List<CharacterToList> characters = [];

  // jsonData.forEach((element) {
  //   characters.add(CharacterToList(
  //     name: element['name'],
  //     gender: element['gender'],
  //     image: element['image'],
  //   ));
  // });
  // for (var item in jsonData!) {
  //   print("leaseee");

  //   final character = CharacterToList(
  //     name: item['name'],
  //     gender: item['gender'],
  //     image: item['image'],
  //   );

  //   print(characters.length);
  //   characters.add(character);
  // }
  // _items = characters;
  // return characters;

  // }
  Future<List<Results>> getcharactersList() async {
    final response = await http.Client().get(Uri.parse('$_baseUrl/character'));
    var characterResponse = Character.fromJson(json.decode(response.body));
    return characterResponse.results!;
  }

  Future<detail.CharacterDetails> getCharacterInfo(int CharacterId) async {
    final characterIdString = CharacterId.toString();
    final response = await http.get(
      Uri.parse('$_baseUrl/character/$characterIdString'),
    );
    var characterinfo = detail.CharacterDetails.fromJson(
      json.decode(response.body),
    );

    return characterinfo;
  }

  Future<detail.Origin> getDitailsOrigin(int CharacterId) async {
    final characterIdString = CharacterId.toString();

    final response = await http.get(
      Uri.parse('$_baseUrl/character/$characterIdString'),
    );
    var originInfo = detail.Origin.fromJson(
      json.decode(response.body),
    );
    return originInfo;
  }
}

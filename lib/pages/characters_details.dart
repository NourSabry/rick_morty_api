import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_morty/models/character_details.dart';
import 'package:rick_morty/services/character_services.dart';
import 'package:rick_morty/widgets/detail_card.dart';

class CharactersDetailsScreen extends StatefulWidget {
  final int characterId;
  const CharactersDetailsScreen({
    super.key,
    required this.characterId,
  });

  @override
  State<CharactersDetailsScreen> createState() =>
      _CharactersDetailsScreenState();
}

class _CharactersDetailsScreenState extends State<CharactersDetailsScreen> {
  CharacterDetails? _info;
  Origin? _origin;
  bool _isLoading = false;

  CharacterSevices get _service => GetIt.I<CharacterSevices>();

  @override
  void initState() {
    getCharsDetails();
    super.initState();
  }

  getCharsDetails() async {
    setState(() {
      _isLoading = true;
    });

    _info = await _service.getCharacterInfo(widget.characterId);
    _origin = await _service.getDitailsOrigin(widget.characterId);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.cyan,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          _info!.name!,
          style: const TextStyle(
            color: Colors.cyan,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.015,
          vertical: size.height * 0.05,
        ),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : DetailsCard(
                created: _info!.created!,
                gender: _info!.gender!,
                image: _info!.image!,
                name: _info!.name!,
                status: _info!.status!,
                type: _info!.type!,
                location: _origin!.name!,
                origin: _origin!.name!,
              ),
      ),
    );
  }
}

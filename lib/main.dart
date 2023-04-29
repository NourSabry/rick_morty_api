// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_morty/pages/home_page.dart';
import 'package:rick_morty/services/character_services.dart';

void dependancyInjection() {
  GetIt.I.registerLazySingleton(() => CharacterSevices());
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dependancyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePageCharacters(),
    );
  }
}

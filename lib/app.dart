import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:pokemons/routes/routes.dart';

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemons',
      theme: greenTheme,
      routes: routes,
    );
  }
}

import 'package:domain/domain.dart';
import 'package:domain/models/pokemon.g.dart';
import 'package:domain/models/pokemonDetails.g.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemons/app.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PokemonAdapter());
  Hive.registerAdapter(PokemonDetailsAdapter());

  const pokemonList = 'pokemon_list_box';
  final pokemonListBox = Hive.openBox<List<Pokemon>>(pokemonList);
  runApp(const PokemonApp());
}

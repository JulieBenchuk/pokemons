import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/models/pokemon.g.dart';
import 'package:domain/models/pokemonDetails.g.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemons/app.dart';
import 'package:get_it/get_it.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PokemonAdapter());
  Hive.registerAdapter(PokemonDetailsAdapter());

  const pokemonList = 'pokemon_list_box';
  const amountOfPage = 'amount_of_page';
  final pokemonListBox = await Hive.openBox<Pokemon>(pokemonList);
  final amountOfPageBox = await Hive.openBox<int>(amountOfPage);
  GetIt.I.registerLazySingleton<AbstractPokemonRepository>(() =>
      PokemonRepository(
          dio: Dio(),
          pokemonListBox: pokemonListBox,
          amountOfPageBox: amountOfPageBox));
  runApp(const PokemonApp());
}

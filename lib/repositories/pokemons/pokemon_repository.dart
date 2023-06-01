import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:pokemons/repositories/pokemons/abstract_pokemon_repository.dart';
import 'package:pokemons/repositories/pokemons/models/models.dart';

class CryptoRepository implements AbstractPokemonRepository {
  @override
  Future<List<Pokemon>> getPokemonList() async {
    const String pokemonListURL = 'https://pokeapi.co/api/v2/pokemon';
    final response = await Dio().get(pokemonListURL);
    final data = response.data as Map<String, dynamic>;
    final result = data['results'] as List<Pokemon>;
    return result;
  }
}

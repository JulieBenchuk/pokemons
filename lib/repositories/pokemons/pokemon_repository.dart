import 'package:core/core.dart';
import 'package:pokemons/repositories/pokemons/abstract_pokemon_repository.dart';
import 'package:pokemons/repositories/pokemons/models/models.dart';

class PokemonRepository implements AbstractPokemonRepository {
  @override
  Future<List<Pokemon>> getPokemonList() async {
    const String pokemonListURL = 'https://pokeapi.co/api/v2/pokemon';
    final response = await Dio().get(pokemonListURL);
    final data = response.data as Map<String, dynamic>;
    final result = data['results'] as List<dynamic>;
    final resultList =
        result.map((e) => Pokemon(name: e['name'], url: e['url'])).toList();
    return resultList;
  }
}

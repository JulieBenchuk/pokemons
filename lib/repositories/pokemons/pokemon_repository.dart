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
  @override
  Future<Map<String, Object>> getPokemonDetails(pokemonUrl) async {
    final response = await Dio().get(pokemonUrl);
    final data = response.data as Map<String, dynamic>;
    final String name = data['name'];
    final int weight = data['weight'];
    final int id = data['id'];
    final int height = data['height'];
    final String imgUrl = data['sprites']['front_default'];
    final List types = data['types'] as List<dynamic>;
    final List listOfTypes = types.map((e) => e['type']['name']).toList();
    final pokemonDetails = {'name': name, 'id': id, 'weight': weight, 'height': height, 'types': listOfTypes, 'imgUrl': imgUrl};
    return pokemonDetails;
  }
}

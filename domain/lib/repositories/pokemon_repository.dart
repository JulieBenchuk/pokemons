import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PokemonRepository implements AbstractPokemonRepository {
  int limit = 20;
  Box<Pokemon>? pokemonListBox;

  @override
  Future<List<Pokemon>> getPokemonList(currentPage) async {
    final int offset = (currentPage) * limit;
    final String pokemonListUrl =
        'https://pokeapi.co/api/v2/pokemon/?offset=$offset&limit=$limit';
    final response = await Dio().get(pokemonListUrl);
    final data = response.data as Map<String, dynamic>;
    final result = data['results'] as List<dynamic>;
    final resultList = result
        .map((e) => Pokemon(() {}, name: e['name'], url: e['url']))
        .toList();
    final resultMap = {for (var e in resultList) e: e};
    await pokemonListBox?.putAll(resultMap);
    return resultList;
  }

  @override
  Future<int> getAmountOfPage() async {
    final response = await Dio().get('https://pokeapi.co/api/v2/pokemon/');
    final data = response.data as Map<String, dynamic>;
    final int amountOfPage = (data['count'] / limit).round() + 1;
    return amountOfPage;
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
    final Map<String, Object> pokemonDetails = {
      "name": name,
      "id": id,
      "weight": weight,
      "height": height,
      "types": listOfTypes,
      "imgUrl": imgUrl
    };
    return pokemonDetails;
  }
}

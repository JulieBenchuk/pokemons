import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PokemonRepository implements AbstractPokemonRepository {
  PokemonRepository(
      {required this.dio,
      required this.pokemonListBox,
      required this.amountOfPageBox,
      required this.pokemonDetailsBox});
  final Dio dio;
  final Box<Pokemon> pokemonListBox;
  final Box<int> amountOfPageBox;
  final Box pokemonDetailsBox;
  int limit = 20;

  @override
  Future<List<Pokemon>> getPokemonList(currentPage) async {
    var pokemonList = <Pokemon>[];
    try {
      final int offset = (currentPage) * limit;
      pokemonList = await _fetchPokemonListFromApi(offset);
      final resultMap = {for (var e in pokemonList) e.url: e};
      await pokemonListBox.putAll(resultMap);
    } catch (e) {
      return pokemonListBox.values.toList();
    }
    return pokemonList;
  }

  @override
  Future<int> getAmountOfPage() async {
    var amountOfPage = 0;
    try {
      amountOfPage = await _fetchAmountOfPage(amountOfPage);
      await amountOfPageBox.put("amountOfPage", amountOfPage);
    } catch (e) {
      return amountOfPageBox.values.first;
    }
    return amountOfPage;
  }

  @override
  Future<Map<String, Object>> getPokemonDetails(pokemonUrl) async {
    var pokemonDetails;
    try {
      pokemonDetails = await _fetchPokemonDetails(pokemonUrl);
      await pokemonDetailsBox.putAll(pokemonDetails);
    } catch (e) {}
    return pokemonDetails;
  }

  Future<List<Pokemon>> _fetchPokemonListFromApi(int offset) async {
    final String pokemonListUrl =
        'https://pokeapi.co/api/v2/pokemon/?offset=$offset&limit=$limit';
    final response = await dio.get(pokemonListUrl);
    final data = response.data as Map<String, dynamic>;
    final result = data['results'] as List<dynamic>;
    final resultList =
        result.map((e) => Pokemon(name: e['name'], url: e['url'])).toList();
    return resultList;
  }

  Future<Map<String, Object>> _fetchPokemonDetails(pokemonUrl) async {
    final response = await dio.get(pokemonUrl);
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

  Future<int> _fetchAmountOfPage(int amountOfPage) async {
    final response = await dio.get('https://pokeapi.co/api/v2/pokemon/');
    final data = response.data as Map<String, dynamic>;
    amountOfPage = (data['count'] / limit).round() + 1;
    return amountOfPage;
  }
}

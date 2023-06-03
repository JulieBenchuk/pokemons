import 'package:pokemons/repositories/pokemons/models/models.dart';

abstract class AbstractPokemonRepository {
  Future<List<Pokemon>> getPokemonList();
}
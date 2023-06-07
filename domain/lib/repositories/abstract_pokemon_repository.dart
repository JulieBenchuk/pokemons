import '../models/models.dart';

abstract class AbstractPokemonRepository {
  Future<List<Pokemon>> getPokemonList(currentPage);
  Future<PokemonDetails> getPokemonDetails(pokemonUrl);
  Future<int> getAmountOfPage();
}

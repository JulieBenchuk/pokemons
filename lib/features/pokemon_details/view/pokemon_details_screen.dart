import 'package:flutter/material.dart';
import 'package:pokemons/repositories/pokemons/pokemon_repository.dart';

class PokemonDetailsScreen extends StatefulWidget {
  const PokemonDetailsScreen({super.key});

  @override
  State<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  String? pokemonUrl;
  Map? pokemonDetails;
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide string args');
    pokemonUrl = args as String;
    _getPokemonDetails();
    super.didChangeDependencies();
  }
  @override
  void initState() {
    _getPokemonDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemonDetails == null ? 'loading name..' : pokemonDetails!['name']),
      ),
      body:  pokemonDetails == null ? const Center(child: CircularProgressIndicator())
      : Center(child: Text('name: ${pokemonDetails!['name']}, id: ${pokemonDetails!['id']}, weight: ${pokemonDetails!['weight']}, height: ${pokemonDetails!['height']}')),
    );
  }

  Future<Map<String, dynamic>> _getPokemonDetails() async =>
      pokemonDetails = await PokemonRepository().getPokemonDetails(pokemonUrl);
}

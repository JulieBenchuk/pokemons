import 'package:flutter/material.dart';
import 'package:pokemons/repositories/pokemons/pokemon_repository.dart';

class PokemonDetailsScreen extends StatefulWidget {
  const PokemonDetailsScreen({super.key});

  @override
  State<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  String? pokemonUrl;
  Map<dynamic, dynamic>? pokemonDetails;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide string args');
    pokemonUrl = args as String;
    _getPokemonDetails();
    super.didChangeDependencies();
  }

/*  @override
  void initState() {
    _getPokemonDetails();
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemonDetails == null
            ? 'loading name..'
            : pokemonDetails!['name']),
      ),
      body: pokemonDetails == null
          ? const Center(child: Text('loading'))
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.yellow,
                      child: Image.network(pokemonDetails!['imgUrl']),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Center(
                          child: Text(pokemonDetails!['name'],
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold)))),
                  Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.pink,
                      child:  Column(
                        children: [
                          Text(
                              'Weight: ${pokemonDetails!['weight']}'),
                          Text(
                              'Height: ${pokemonDetails!['height']}'),
                          Text(
                              'Types: ${pokemonDetails!['types'].toString()}'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future<Map<String, Object>> _getPokemonDetails() async =>
      pokemonDetails = await PokemonRepository().getPokemonDetails(pokemonUrl);
}

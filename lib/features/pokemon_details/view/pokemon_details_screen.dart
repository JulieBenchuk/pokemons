import 'package:flutter/material.dart';
import 'package:domain/domain.dart';

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
            ? '...'
            : '${pokemonDetails!['name']} details'.toUpperCase()),
      ),
      body: pokemonDetails == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Image.network(pokemonDetails!['imgUrl']),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Center(
                          child: Text(pokemonDetails!['name'],
                              style: Theme.of(context).textTheme.bodyLarge))),
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: Column(
                        children: [
                          Text('Weight: ${pokemonDetails!['weight']}',
                              style: Theme.of(context).textTheme.bodyMedium),
                          Text('Height: ${pokemonDetails!['height']}',
                              style: Theme.of(context).textTheme.bodyMedium),
                          Text('Types: ${pokemonDetails!['types'].toString()}',
                              style: Theme.of(context).textTheme.bodyMedium),
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

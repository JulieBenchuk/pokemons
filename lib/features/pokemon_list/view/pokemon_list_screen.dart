import 'package:flutter/material.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  List<Pokemon>? pokemonList;
  @override
  void initState() {
    _getPokemonList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: pokemonList == null
          ? const Center(child: Text('loading...'))
          : ListView.separated(
              padding: const EdgeInsets.only(top: 20),
              itemCount: pokemonList!.length,
              separatorBuilder: (context, i) => const Divider(),
              itemBuilder: (context, i) {
                final pokemon = pokemonList![i];
                return PokemonTile(pokemon: pokemon);
              }),
    );
  }

  Future<List<Pokemon>> _getPokemonList() async =>
      pokemonList = await PokemonRepository().getPokemonList();
}

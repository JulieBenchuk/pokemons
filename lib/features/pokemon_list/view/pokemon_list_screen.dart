import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pokemons/features/pokemon_list/widgets/widgets.dart';
import '../../../repositories/pokemons/models/models.dart';
import '../../../repositories/pokemons/pokemon_repository.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  List<Pokemon>? pokemonList;
  int numberOfPages = 100;
  int currentPage = 0;

  @override
  void initState() {
    _getPokemonList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "List of pokemons",
        )),
      ),
      body: pokemonList == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NumberPaginator(
                    numberPages: numberOfPages,
                    initialPage: currentPage,
                    config: NumberPaginatorUIConfig(
                      buttonUnselectedForegroundColor: Colors.white,
                      buttonSelectedBackgroundColor: Colors.red,
                      buttonShape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPageChange: (index) {
                      setState(() {
                        currentPage = index;
                        _getPokemonList();
                      });
                    },
                  ),
                ),
                Expanded(
                    child: Container(
                        child: ListView.separated(
                            padding: const EdgeInsets.only(top: 20),
                            itemCount: pokemonList!.length,
                            separatorBuilder: (context, i) => const Divider(),
                            itemBuilder: (context, i) {
                              final pokemon = pokemonList![i];
                              return PokemonTile(pokemon: pokemon);
                            }))),
              ],
            ),
    );
  }

  Future<List<Pokemon>> _getPokemonList() async =>
      pokemonList = await PokemonRepository().getPokemonList(currentPage);
}

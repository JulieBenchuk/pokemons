import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pokemons/features/pokemon_list/widgets/widgets.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  List<Pokemon>? pokemonList;
  int currentPage = 0;
  int amountOfPage = 0;

  @override
  void initState() {
    _getPokemonList();
    _getAmountOfPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "List of pokemons",
        ),
      ),
      body: pokemonList == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _getPaginator(),
                ),
                Expanded(
                    child: ListView.separated(
                        padding: const EdgeInsets.only(top: 20),
                        itemCount: pokemonList!.length,
                        separatorBuilder: (context, i) => const Divider(),
                        itemBuilder: (context, i) {
                          final pokemon = pokemonList![i];
                          return PokemonTile(pokemon: pokemon);
                        })),
              ],
            ),
    );
  }

  NumberPaginator _getPaginator() {
    return NumberPaginator(
      numberPages: amountOfPage,
      initialPage: currentPage,
      config: NumberPaginatorUIConfig(
        buttonUnselectedForegroundColor: Colors.white,
        buttonSelectedBackgroundColor: Colors.red,
        buttonShape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPageChange: (index) {
        currentPage = index;
        _getPokemonList().then((value) => {
              setState(() {
                pokemonList = value;
              })
            });
      },
    );
  }

  Future<List<Pokemon>> _getPokemonList() async =>
      pokemonList = await PokemonRepository().getPokemonList(currentPage);
  Future<int> _getAmountOfPage() async =>
      amountOfPage = await PokemonRepository().getAmountOfPage();
}

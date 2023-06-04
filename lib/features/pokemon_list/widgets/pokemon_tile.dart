import 'package:flutter/material.dart';

import '../../../repositories/pokemons/models/models.dart';

class PokemonTile extends StatelessWidget {
  const PokemonTile({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(pokemon.name),
      onTap: () {
        Navigator.of(context).pushNamed('/details', arguments: pokemon.url);
      },
    );
  }
}

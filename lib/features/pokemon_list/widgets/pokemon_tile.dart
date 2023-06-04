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
      leading: Image.network('https://cdn.iconscout.com/icon/free/png-256/free-pokemon-pokeball-game-go-34722.png', width: 40, height: 40,),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.red,),
      title: Text(pokemon.name, style: Theme.of(context).textTheme.bodyMedium,),
      onTap: () {
        Navigator.of(context).pushNamed('/details', arguments: pokemon.url);
      },
    );
  }
}

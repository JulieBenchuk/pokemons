import '../features/pokemon_details/view/view.dart';
import '../features/pokemon_list/view/view.dart';

final routes = {
  '/': (context) => const PokemonListScreen(),
  '/details': (context) => const PokemonDetailsScreen(),
};

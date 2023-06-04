class Pokemon {
  const Pokemon({required this.name, required this.url});
  final String name;
  final String url;
}
class PokemonDetails {
  const PokemonDetails({required this.name, required this.weight, required this.height, required this.types, required this.imgUrl});
  final String name;
  final int weight;
  final int height;
  final List<String> types;
  final String imgUrl;
}

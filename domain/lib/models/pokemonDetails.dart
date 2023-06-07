class PokemonDetails {
  final String name;
  final int id;
  final int weight;
  final int height;
  final List<String> types;
  final String imgUrl;

  PokemonDetails({
    required this.name,
    required this.id,
    required this.weight,
    required this.height,
    required this.types,
    required this.imgUrl,
  });
}

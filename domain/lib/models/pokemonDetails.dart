class PokemonDetails {
  const PokemonDetails(
      {required this.id,
      required this.name,
      required this.weight,
      required this.height,
      required this.types,
      required this.imgUrl});
  final int id;
  final String name;
  final int weight;
  final int height;
  final List<String> types;
  final String imgUrl;
}

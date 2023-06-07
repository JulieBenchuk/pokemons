import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class PokemonDetails {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final int weight;
  @HiveField(3)
  final int height;
  @HiveField(4)
  final List<String> types;
  @HiveField(5)
  final String imgUrl;

  PokemonDetails(
    read, {
    required this.name,
    required this.id,
    required this.weight,
    required this.height,
    required this.types,
    required this.imgUrl,
  });
}

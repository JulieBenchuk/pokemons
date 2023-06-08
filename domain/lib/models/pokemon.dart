import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Pokemon {
  const Pokemon({
    required this.name,
    required this.url,
  });

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String url;

  @override
  List<Object> get props => [name, url];
}

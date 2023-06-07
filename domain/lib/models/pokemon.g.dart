import 'package:domain/models/pokemon.dart';
import 'package:hive/hive.dart';

class PokemonAdapter extends TypeAdapter<Pokemon> {
  @override
  final typeId = 1;

  @override
  Pokemon read(BinaryReader reader) {
    return Pokemon(reader.read(), name: '', url: '');
  }

  @override
  void write(BinaryWriter writer, Pokemon obj) {
    writer.write(obj.name);
  }
}

import 'package:domain/models/pokemonDetails.dart';
import 'package:hive/hive.dart';

class PokemonDetailsAdapter extends TypeAdapter<PokemonDetails> {
  @override
  final typeId = 2;

  @override
  PokemonDetails read(BinaryReader reader) {
    return PokemonDetails(
      reader.read(),
      id: 0,
      height: 0,
      imgUrl: '',
      name: '',
      types: [],
      weight: 0,
    );
  }

  @override
  void write(BinaryWriter writer, PokemonDetails obj) {
    writer.write(obj.name);
  }
}

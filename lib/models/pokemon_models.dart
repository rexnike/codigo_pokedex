
class PokemonModel{
  String name;
  String img;
  List<String> type;
  String numPokemon;
  String height;

  PokemonModel({
    required this.name, 
    required this.img, 
    required this.type,
    required this.numPokemon,
    required this.height,
    });

  factory PokemonModel.fromJson(Map<String, dynamic>json) => PokemonModel(
    name: json["name"], 
    img: json["img"], 
    type: List<String>.from(json["type"].map((e)=>e)),
    numPokemon: json["num"],
    height: json["height"],
    );
}
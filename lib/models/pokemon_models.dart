
class PokemonModel{
  String name;
  String img;
  List<String> type;

  PokemonModel({
    required this.name, 
    required this.img, 
    required this.type });

  factory PokemonModel.fromJson(Map<String, dynamic>json) => PokemonModel(
    name: json["name"], 
    img: json["img"], 
    type: List<String>.from(json["type"].map((e)=>e)),
    );
}
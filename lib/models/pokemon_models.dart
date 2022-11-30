
class pokemon{
  String name;
  String img;
  List<String> type;

  pokemon({
    required this.name, 
    required this.img, 
    required this.type });

  factory pokemon.fromJson(Map<String, dynamic>json) => pokemon(
    name: json["name"], 
    img: json["img"], 
    type: List<String>.from(json["type"].map((e)=>e)),
    );
}
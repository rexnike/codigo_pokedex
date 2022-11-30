import 'dart:convert';
import 'package:codigo_pokedex/models/pokemon_models.dart';
import 'package:codigo_pokedex/ui/widgets/item_pokemon_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


//uri permite identificar el recurso e identificarlo
//url funaciona como localisador del servidoor
class HomePage extends StatefulWidget {
  const HomePage({super.key});

@override
State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List pokemons =[];
List<PokemonModel> pokemonModel =[];

@override
initState(){
  super.initState();
  getDataPokemon();
}

getDataPokemon() async{
  Uri _uri = Uri.parse(
    "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
  http.Response response = await http.get(_uri);
  if(response.statusCode == 200){
    Map<String,dynamic> myMap = json.decode(response.body);
    //pokemons = myMap["pokemon"];
    pokemonModel = myMap["pokemon"].map<PokemonModel>((e)=> PokemonModel.fromJson(e)).toList();
    print(PokemonModel);
    setState((){});
    //pokemons.forEach((element) {
      //print(element["name"]);
    //});
  }
}

@override
Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12.0,
                ),
                const Text(
                  "Pokedex",
                  style: TextStyle(
                    fontSize: 34.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                
                const SizedBox(
                  height: 30.0,
                ),

                //imagen de fondo
                GridView.count(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 1.35,
                  children: pokemonModel.
                  map((e) => ItemPokemonWidget(
                    //name: e.name,
                    //image: e.img,
                    //types: e.type,
                    pokemon: e,
                  ),
                  )
                  .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
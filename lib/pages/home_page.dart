import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 


//uri permite identificar el recurso e identificarlo
//url funaciona como localisador del servidoor

List pokemons =[];

getDataPokemon() async{
  Uri _uri = Uri.parse(
    "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
  http.Response response = await http.get(_uri);
  if(response.statusCode == 200){
    Map<String,dynamic> myMap = json.decode(response.body);
    pokemons = myMap["pokemon"];
    print(pokemons);
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    getDataPokemon();
    
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
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 1.35,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                      color: Color(0xff4CCFB2),
                      borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: -20,
                            right: -20,
                          child :Image.asset(
                            'assets/images/pokeball.png',
                            height: 120.0,
                            color: Colors.white.withOpacity(0.27),
                            ),
                          ),

                          //nombre
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                            child: Column(
                              children: [
                                Text(
                                  "Bulbasaur",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                                  //atributos
                                  Container(
                                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                                    padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.27),
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.4),
                                          offset: const Offset(4,4),
                                          blurRadius: 12.0,
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      "Grass",
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                      ),
                                  ),
                              ],
                            ),
                          ),

                          //segunda imagen central
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Image.network(
                              "http://www.serebii.net/pokemongo/pokemon/001.png"
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
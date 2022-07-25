import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokedex/models/pokedex.dart';

Future<int?> getPokemonCount() async {
  var url = "https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0";

  Response response = await Dio()
      .get(url,
          options: Options(
            contentType: "application/json",
          ))
      .catchError((onError) {
    if (onError is DioError) {
      throw (onError.response != null
          ? onError.response!.data.toString()
          : onError.toString());
    }
    throw ((onError));
  }).then((value) {
    return value;
  });
  if (response.statusCode == 200 || response.statusCode == 204) {
    return response.data['count'];
  }
}

Future<List<Pokedex>> getPokemonList() async {
  List<Pokedex> Pokemonlist = [];
  int? count = await getPokemonCount();
  var url = "https://pokeapi.co/api/v2/pokemon";

  for (var i = 1; i <= 6; i++) {
    Response response = await Dio()
        .get(url + "/$i",
            options: Options(
              contentType: "application/json",
            ))
        .catchError((onError) {
      debugPrint(" ~~ Error api : $onError");
      if (onError is DioError) {
        throw (onError.response != null
            ? onError.response!.data.toString()
            : onError.toString());
      }
      throw ((onError));
    }).then((value) {
      debugPrint("~~~Response status : ${value.data['name']}");
      return value;
    });
    if (response.statusCode == 200 || response.statusCode == 204) {
      Pokedex p = Pokedex.fromJson(response.data);
      debugPrint("~~Pokemon: ${p.name}");
      Pokemonlist.add(p);
    }
  }
  debugPrint("~~ Api Res: Pokemonlist len: ${Pokemonlist.length}");
  return Pokemonlist;
}

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/controllers/api_controller.dart';
import 'package:pokedex/models/pokedex.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  List<Pokedex> favorites = [];
  List<Pokedex> list = [];
  PokemonBloc() : super(PokemonInitial()) {
    on<RequestPokemonList>((event, emit) async {
      debugPrint("~~ Requesting List");
      emit(PokemonLoading());
      debugPrint("~~ State is $state");
      await getPokemonList().then((value) {
        list = value;
        emit(PokemonLoaded(value, favorites));
        debugPrint("~~ State is $state");
        debugPrint("~~ Loaded len ${value.length}");
      }).catchError((e) {
        emit(PokemonError(e));
        debugPrint("~~ State is $state");
        debugPrint("~~ Error : ${e}");
      });
    });
    on<AddToFavorites>((event, emit) {
      emit(PokemonLoading());

      favorites.add(event.p);
      emit(PokemonLoaded(list, favorites));
    });
    on<RemoveFromFavorites>((event, emit) {
      emit(PokemonLoading());
      favorites.remove(event.p);
      emit(PokemonLoaded(list, favorites));
    });
    on<InitCall>((event, emit) {
      emit(PokemonInitial());
      debugPrint("~~~ PokemonInitial");
    });
  }

  // @override
  // PokemonState? fromJson(Map<String, dynamic> json) {
  //   // TODO: implement fromJson
  //   throw UnimplementedError();
  // }

  // @override
  // Map<String, dynamic>? toJson(PokemonState state) {
  //   // TODO: implement toJson
  //   throw UnimplementedError();
  // }
}

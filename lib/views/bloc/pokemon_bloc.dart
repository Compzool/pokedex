import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/controllers/api_controller.dart';
import 'package:pokedex/models/pokedex.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial()) {
    on<RequestPokemonList>((event, emit) async {
      debugPrint("~~ Requesting List");
      emit(PokemonLoading());
      debugPrint("~~ State is $state");
      await getPokemonList().then((value) {
        emit(PokemonLoaded(value));
        debugPrint("~~ State is $state");
        debugPrint("~~ Loaded len ${value.length}");
      }).catchError((e) {
        emit(PokemonError(e));
        debugPrint("~~ State is $state");
        debugPrint("~~ Error : ${e}");
      });
    });
    on<InitCall>((event, emit) {
      emit(PokemonInitial());
      debugPrint("~~~ PokemonInitial");
    });
  }
}

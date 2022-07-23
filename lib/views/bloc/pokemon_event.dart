part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InitCall extends PokemonEvent {}

class RequestPokemonList extends PokemonEvent {}

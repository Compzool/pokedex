part of 'pokemon_bloc.dart';

@immutable
class PokemonState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final List<Pokedex> list;
  PokemonLoaded(this.list);
  @override
  List<Object?> get props => [list];
}

class PokemonError extends PokemonState {
  final errorMessage;
  PokemonError(this.errorMessage);
}

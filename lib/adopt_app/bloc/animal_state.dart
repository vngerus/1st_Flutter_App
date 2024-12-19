part of 'animal_bloc.dart';

enum AnimalPageState {
  none,
  loading,
  success,
  failure,
}

class AnimalState extends Equatable {
  final List<AnimalModel> animals;
  final List<AnimalModel> filteredAnimals;
  final List<AnimalModel> favorites;
  final AnimalPageState pageState;
  final String filter;

  const AnimalState({
    required this.animals,
    required this.filteredAnimals,
    required this.favorites,
    required this.pageState,
    required this.filter,
  });

  factory AnimalState.initial() {
    return AnimalState(
      animals: List.empty(),
      filteredAnimals: List.empty(),
      favorites: List.empty(),
      pageState: AnimalPageState.none,
      filter: "dog",
    );
  }

  AnimalState copyWith({
    List<AnimalModel>? animals,
    List<AnimalModel>? filteredAnimals,
    List<AnimalModel>? favorites,
    AnimalPageState? pageState,
    String? filter,
  }) {
    return AnimalState(
      animals: animals ?? this.animals,
      filteredAnimals: filteredAnimals ?? this.filteredAnimals,
      favorites: favorites ?? this.favorites,
      pageState: pageState ?? this.pageState,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object> get props => [
        animals,
        filteredAnimals,
        favorites,
        pageState,
        filter,
      ];
}

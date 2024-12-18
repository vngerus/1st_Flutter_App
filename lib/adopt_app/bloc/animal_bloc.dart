import 'package:equatable/equatable.dart';
import 'package:firstflutterapp/adopt_app/animal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'animal_event.dart';
part 'animal_state.dart';

class AnimalBloc extends Bloc<AnimalEvent, AnimalState> {
  AnimalBloc() : super(AnimalState.initial()) {
    on<LoadAnimals>(_onLoadAnimals);
    on<ToggleFavorite>(_onToggleFavorite);
    on<ChangeFilter>(_onChangeFilter);
  }

  void _onLoadAnimals(LoadAnimals event, Emitter<AnimalState> emit) async {
    emit(state.copyWith(pageState: AnimalPageState.loading));
    try {
      await Future.delayed(const Duration(seconds: 4));
      emit(state.copyWith(pageState: AnimalPageState.success));
    } catch (e) {
      emit(state.copyWith(pageState: AnimalPageState.failure));
    }
  }

  void _onToggleFavorite(ToggleFavorite event, Emitter<AnimalState> emit) {}

  void _onChangeFilter(ChangeFilter event, Emitter<AnimalState> emit) {}
}

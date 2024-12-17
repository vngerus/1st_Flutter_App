part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TodoEvent {
  final String title;

  const AddTaskEvent({required this.title});
}

class UpdateState extends TodoEvent {
  final int index;

  const UpdateState({required this.index});
}

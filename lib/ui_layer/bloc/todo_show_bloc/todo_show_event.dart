part of 'todo_show_bloc.dart';

sealed class TodoShowEvent extends Equatable {
  const TodoShowEvent();
  @override
  List<Object?> get props => [];
}

class LoadTodoById extends TodoShowEvent {
  final int id;
  const LoadTodoById(this.id);

  @override
  List<Object?> get props => [id];
}
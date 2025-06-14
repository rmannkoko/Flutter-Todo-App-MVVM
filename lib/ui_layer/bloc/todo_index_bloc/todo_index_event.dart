part of 'todo_index_bloc.dart';

sealed class TodoIndexEvent extends Equatable {
  const TodoIndexEvent();

  @override
  List<Object?> get props => [];
}

class LoadTodosIndex  extends TodoIndexEvent {
  @override
  List<Object?> get props => [];
}
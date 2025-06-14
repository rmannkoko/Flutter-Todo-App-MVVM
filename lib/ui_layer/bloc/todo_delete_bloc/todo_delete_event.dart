part of 'todo_delete_bloc.dart';

sealed class TodoDeleteEvent extends Equatable {
  const TodoDeleteEvent();
  @override
  List<Object?> get props => [];
}

class DeleteTodo extends TodoDeleteEvent {
  final int id;
  const DeleteTodo(this.id);

  @override
  List<Object?> get props => [id];
}
part of 'todo_update_bloc.dart';

sealed class TodoUpdateEvent extends Equatable {
  const TodoUpdateEvent();
  @override
  List<Object?> get props => [];
}

class UpdateTodo extends TodoUpdateEvent {
  final TodoModel todo;
  const UpdateTodo(this.todo);

  @override
  List<Object?> get props => [todo];
}
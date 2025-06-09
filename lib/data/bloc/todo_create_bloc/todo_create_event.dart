part of 'todo_create_bloc.dart';

sealed class TodoCreateEvent extends Equatable {
  const TodoCreateEvent();
  @override
  List<Object?> get props => [];
}

class CreateTodo extends TodoCreateEvent {
  final TodoModel todo;
  const CreateTodo(this.todo);

  @override
  List<Object?> get props => [todo];

}
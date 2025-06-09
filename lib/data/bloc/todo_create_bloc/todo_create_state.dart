part of 'todo_create_bloc.dart';

abstract class TodoCreateState extends Equatable {
  const TodoCreateState();
  @override
  List<Object?> get props => [];
}

class TodoCreateInitial extends TodoCreateState {}
class TodoCreateLoading extends TodoCreateState {}
class TodoCreateSuccess extends TodoCreateState {
  final TodoModel todo;
  final String message;
  const TodoCreateSuccess(this.todo, this.message);

  @override
  List<Object?> get props => [todo, message];
}

class TodoCreateError extends TodoCreateState {
  final String message;
  const TodoCreateError(this.message);

  @override
  List<Object?> get props => [message];
}
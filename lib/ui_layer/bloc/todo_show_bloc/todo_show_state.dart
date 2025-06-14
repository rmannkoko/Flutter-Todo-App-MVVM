part of 'todo_show_bloc.dart';

abstract class TodoShowState extends Equatable {
  const TodoShowState();
  @override
  List<Object?> get props => [];
}

class TodoShowInitial extends TodoShowState {}
class TodoShowLoading extends TodoShowState {}

class TodoShowLoaded extends TodoShowState {
  final TodoModel todo;
  const TodoShowLoaded(this.todo);

  @override
  List<Object?> get props => [todo];
}

class TodoShowError extends TodoShowState {
  final String message;
  const TodoShowError(this.message);

  @override
  List<Object?> get props => [message];
}
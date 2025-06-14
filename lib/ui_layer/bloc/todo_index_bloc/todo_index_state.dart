part of 'todo_index_bloc.dart';

abstract class TodoIndexState extends Equatable {
  const TodoIndexState();
  @override
  List<Object?> get props => [];
}

class TodoIndexInitial extends TodoIndexState {}
class TodoIndexLoading extends TodoIndexState {}
class TodoIndexLoaded extends TodoIndexState {
  final List<TodoModel> todos;
  const TodoIndexLoaded(this.todos);
  @override
  List<Object?> get props => [todos];
}
class TodoIndexError extends TodoIndexState {
  final String message;
  const TodoIndexError(this.message);
  @override
  List<Object?> get props => [message];
}


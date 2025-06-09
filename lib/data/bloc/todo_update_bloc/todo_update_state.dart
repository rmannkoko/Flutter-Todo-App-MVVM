part of 'todo_update_bloc.dart';

abstract class TodoUpdateState extends Equatable {
  const TodoUpdateState();
  @override
  List<Object?> get props => [];
}

class TodoUpdateInitial extends TodoUpdateState {}
class TodoUpdateLoading extends TodoUpdateState {}
class TodoUpdateSuccess extends TodoUpdateState {
  final TodoModel todo;
  final String message;
  const TodoUpdateSuccess(this.todo, this.message);

  @override
  List<Object?> get props => [todo, message];
}
class TodoUpdateError extends TodoUpdateState {
  final String message;
  const TodoUpdateError(this.message);

  @override
  List<Object?> get props => [message];

}
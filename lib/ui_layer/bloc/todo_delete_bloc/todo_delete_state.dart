part of 'todo_delete_bloc.dart';

abstract class TodoDeleteState extends Equatable {
  const TodoDeleteState();
  @override
  List<Object?> get props => [];
}

class TodoDeleteInitial extends TodoDeleteState {}
class TodoDeleteLoading extends TodoDeleteState {}

class TodoDeleteSuccess extends TodoDeleteState {
  final int id;
  final String message;
  const TodoDeleteSuccess(this.message, this.id);
  @override
    List<Object?> get props => [id, message];
}

class TodoDeleteError extends TodoDeleteState {
  final String message;
  const TodoDeleteError(this.message);
  @override
    List<Object?> get props => [message];
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data_layer/repository/todo_repository.dart';

part 'todo_delete_event.dart';
part 'todo_delete_state.dart';

class TodoDeleteBloc extends Bloc<TodoDeleteEvent, TodoDeleteState> {
  final TodoRepository todoRepository;
  TodoDeleteBloc({required this.todoRepository}) : super(TodoDeleteInitial()) {
    on<DeleteTodo>((event, emit) {
      emit(TodoDeleteLoading());
      try {
        todoRepository.deleteTodo(event.id);
        emit(TodoDeleteSuccess('Todo deleted successfully', event.id));
      } catch (e) {
        emit(TodoDeleteError('Failed to delete todo: $e'));
      }
    });
  }
}

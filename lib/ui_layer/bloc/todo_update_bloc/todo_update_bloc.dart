import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data_layer/repository/todo_repository.dart';
import '../../../data_layer/todo_model.dart';

part 'todo_update_event.dart';
part 'todo_update_state.dart';

class TodoUpdateBloc extends Bloc<TodoUpdateEvent, TodoUpdateState> {
  final TodoRepository todoRepository;
  TodoUpdateBloc({required this.todoRepository}) : super(TodoUpdateInitial()) {
    on<UpdateTodo>((event, emit) async {
      emit(TodoUpdateLoading());
      try {
        final updatedTodo = await todoRepository.updateTodo(event.todo);
        emit(TodoUpdateSuccess(updatedTodo, 'Todo updated successfully'));
      } catch (e) {
        emit(TodoUpdateError('Failed to update todo: $e'));
      }
    });
  }
}

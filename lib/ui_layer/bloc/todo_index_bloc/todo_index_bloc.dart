import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data_layer/repository/todo_repository.dart';
import '../../../data_layer/todo_model.dart';

part 'todo_index_event.dart';
part 'todo_index_state.dart';

class TodoIndexBloc extends Bloc<TodoIndexEvent, TodoIndexState> {
  final TodoRepository todoRepository;
  TodoIndexBloc({required this.todoRepository}) : super(TodoIndexInitial()) {
    on<LoadTodosIndex >((event, emit) async {
      emit(TodoIndexLoading());
      try {
        final todos = await todoRepository.getTodos();
        emit(TodoIndexLoaded(todos));
      } catch (e) {
        emit(TodoIndexError('Failed to load todos: $e'));
      }
    });
  }
}

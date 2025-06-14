import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data_layer/repository/todo_repository.dart';
import '../../../data_layer/todo_model.dart';

part 'todo_show_event.dart';
part 'todo_show_state.dart';

class TodoShowBloc extends Bloc<TodoShowEvent, TodoShowState> {
  final TodoRepository todoRepository;
  TodoShowBloc({required this.todoRepository}) : super(TodoShowInitial()) {
    on<LoadTodoById>((event, emit) async {
      emit(TodoShowLoading());
      try {
        final todo = await todoRepository.getTodoById(event.id);
        emit(TodoShowLoaded(todo));
      } catch (e) {
        emit(TodoShowError('Failed to load todo: $e'));
      }
    });
  }
}

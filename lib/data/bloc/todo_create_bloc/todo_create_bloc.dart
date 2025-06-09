import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoapp_crud_mvvm/data/repository/todo_repository.dart';

import '../../todo_model.dart';

part 'todo_create_event.dart';
part 'todo_create_state.dart';

class TodoCreateBloc extends Bloc<TodoCreateEvent, TodoCreateState> {
  final TodoRepository todoRepository;
  TodoCreateBloc({required this.todoRepository}) : super(TodoCreateInitial()) {
    on<CreateTodo>((event, emit) async {
      emit(TodoCreateLoading());
      try {
        final newTodo = await todoRepository.createTodo(event.todo);
        emit(TodoCreateSuccess(newTodo, 'Todo created successfully'));
      } catch (e) {
        emit(TodoCreateError('Failed to create todo: $e'));
      }
    });
  }
}

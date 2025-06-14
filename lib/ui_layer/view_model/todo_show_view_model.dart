import 'package:flutter/material.dart';
import '../../data_layer/todo_model.dart';
import '../bloc/todo_show_bloc/todo_show_bloc.dart';

class TodoShowViewModel extends ChangeNotifier {
  final TodoShowBloc todoShowBloc;
  TodoShowViewModel({required this.todoShowBloc});

  void loadTodo(int id){
    todoShowBloc.add(LoadTodoById(id));
  }

  Stream<TodoShowState> get state => todoShowBloc.stream;

  TodoModel? get todo {
    final state = todoShowBloc.state;
    if (state is TodoShowLoaded) {
      return state.todo;
    }
    return null;
  }
  bool get isLoading => todoShowBloc.state is TodoShowLoading;
  String? get errorMessage {
    final state = todoShowBloc.state;
    if (state is TodoShowError) {
      return state.message;
    }
    return null;
  }

}
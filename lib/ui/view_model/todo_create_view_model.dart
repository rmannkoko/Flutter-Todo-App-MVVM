import 'package:flutter/cupertino.dart';
import 'package:todoapp_crud_mvvm/data/bloc/todo_create_bloc/todo_create_bloc.dart';

import '../../data/todo_model.dart';

class TodoCreateViewModel extends ChangeNotifier{
  final TodoCreateBloc todoCreateBloc;
  TodoCreateViewModel({required this.todoCreateBloc});

  void createTodo(TodoModel todo) {
    todoCreateBloc.add(CreateTodo(todo));
  }

  Stream<TodoCreateState> get state => todoCreateBloc.stream;
  bool get isLoading => todoCreateBloc.state is TodoCreateLoading;

  String? get errorMessage => todoCreateBloc.state is TodoCreateError ? (todoCreateBloc.state as TodoCreateError).message : null;
  bool get isSuccess => todoCreateBloc.state is TodoCreateSuccess;
}
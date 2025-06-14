import 'package:flutter/cupertino.dart';

import '../../data_layer/todo_model.dart';
import '../bloc/todo_create_bloc/todo_create_bloc.dart';

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
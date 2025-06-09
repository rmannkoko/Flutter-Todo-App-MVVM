import 'package:flutter/cupertino.dart';

import '../../data/bloc/todo_delete_bloc/todo_delete_bloc.dart';

class TodoDeleteViewModel extends ChangeNotifier{
  final TodoDeleteBloc todoDeleteBloc;
  TodoDeleteViewModel({required this.todoDeleteBloc});

  void deleteTodo(int id) {
    todoDeleteBloc.add(DeleteTodo(id));
  }

  Stream<TodoDeleteState> get state => todoDeleteBloc.stream;

  bool get isLoading => todoDeleteBloc.state is TodoDeleteLoading;
  String? get errorMessage => todoDeleteBloc.state is TodoDeleteError ? (todoDeleteBloc.state as TodoDeleteError).message : null;
  bool get isSuccess => todoDeleteBloc.state is TodoDeleteSuccess;

}
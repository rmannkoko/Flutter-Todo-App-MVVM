import 'package:flutter/cupertino.dart';
import '../../data_layer/todo_model.dart';
import '../bloc/todo_update_bloc/todo_update_bloc.dart';

class TodoUpdateViewModel extends ChangeNotifier{
  final TodoUpdateBloc todoUpdateBloc;
  TodoUpdateViewModel({required this.todoUpdateBloc});

  void updateTodo(TodoModel todo) {
    todoUpdateBloc.add(UpdateTodo(todo));
  }
  
  Stream<TodoUpdateState> get state => todoUpdateBloc.stream;
  bool get isLoading => todoUpdateBloc.state is TodoUpdateLoading;
  String? get errorMessage => todoUpdateBloc.state is TodoUpdateError ? (todoUpdateBloc.state as TodoUpdateError).message : null;
  bool get isSuccess => todoUpdateBloc.state is TodoUpdateSuccess;

}
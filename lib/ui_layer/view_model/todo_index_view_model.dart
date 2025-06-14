import 'package:flutter/cupertino.dart';
import '../../data_layer/todo_model.dart';
import '../bloc/todo_index_bloc/todo_index_bloc.dart';

class TodoIndexViewModel extends ChangeNotifier {
  final TodoIndexBloc todoIndexBloc;
  TodoIndexViewModel({required this.todoIndexBloc});

  void loadTodos() {
    todoIndexBloc.add(LoadTodosIndex());
  }

  Stream<TodoIndexState> get state => todoIndexBloc.stream;

  List<TodoModel> get todos {
    final state = todoIndexBloc.state;
    if (state is TodoIndexLoaded) {
      return state.todos;
    } else {
      return [];
    }
  }

  bool get isLoading => todoIndexBloc.state is TodoIndexLoading;
  String? get errorMessage {
    final state = todoIndexBloc.state;
    if (state is TodoIndexError) {
      return state.message;
    } else {
      return null;
    }
  }
}
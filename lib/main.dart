import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_crud_mvvm/ui_layer/bloc/todo_create_bloc/todo_create_bloc.dart';
import 'package:todoapp_crud_mvvm/ui_layer/bloc/todo_delete_bloc/todo_delete_bloc.dart';
import 'package:todoapp_crud_mvvm/ui_layer/bloc/todo_index_bloc/todo_index_bloc.dart';
import 'package:todoapp_crud_mvvm/ui_layer/bloc/todo_show_bloc/todo_show_bloc.dart';
import 'package:todoapp_crud_mvvm/ui_layer/bloc/todo_update_bloc/todo_update_bloc.dart';
import 'package:todoapp_crud_mvvm/ui_layer/view/todo_create_view.dart';
import 'package:todoapp_crud_mvvm/ui_layer/view/todo_index_view.dart';
import 'package:todoapp_crud_mvvm/ui_layer/view/todo_show_view.dart';
import 'package:todoapp_crud_mvvm/ui_layer/view/todo_update_view.dart';

import 'data_layer/repository/todo_repository.dart';
import 'data_layer/service/todo_create_service.dart';
import 'data_layer/service/todo_delete_service.dart';
import 'data_layer/service/todo_index_service.dart';
import 'data_layer/service/todo_show_service.dart';
import 'data_layer/service/todo_update_service.dart';
import 'data_layer/todo_model.dart';

void main() {
  final todoRepository = TodoRepository(
    indexService: TodoIndexService(),
    createService: TodoCreateService(),
    updateService: TodoUpdateService(),
    deleteService: TodoDeleteService(),
    showService: TodoShowService(),
  );
  runApp(MyApp(todoRepository: todoRepository,));
}

class MyApp extends StatelessWidget {
  final TodoRepository todoRepository;
  const MyApp({super.key, required this.todoRepository});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => TodoIndexBloc(todoRepository: todoRepository)),
          BlocProvider(create: (_) => TodoCreateBloc(todoRepository: todoRepository)),
          BlocProvider(create: (_) => TodoUpdateBloc(todoRepository: todoRepository)),
          BlocProvider(create: (_) => TodoDeleteBloc(todoRepository: todoRepository)),
          BlocProvider(create: (_) => TodoShowBloc(todoRepository: todoRepository)),
        ],
        child: MaterialApp(
          title: 'Todo App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            fontFamily: 'Jost',
          ),
          routes: {
            '/': (_) => TodoIndexView(),
            '/todo-create': (_) => TodoCreateView(),
          },
          onGenerateRoute: (settings) {
            if (settings.name == '/todo-details') {
              return MaterialPageRoute(builder: (_) => TodoShowView(id: settings.arguments as int));
            } else if (settings.name == '/todo-edit') {
              return MaterialPageRoute(builder: (_) => TodoUpdateView(todo: settings.arguments as TodoModel));
            }
            return null;
          }
        )
    );
  }
}



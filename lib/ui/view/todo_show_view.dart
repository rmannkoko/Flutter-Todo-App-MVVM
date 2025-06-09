import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/bloc/todo_show_bloc/todo_show_bloc.dart';
import '../view_model/todo_show_view_model.dart';

class TodoShowView extends StatelessWidget {
  final int id;
  const TodoShowView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    context.read<TodoShowBloc>().add(LoadTodoById(id));

    return Scaffold(
      appBar: AppBar(title: const Text('Todo Show')),
      body: BlocBuilder<TodoShowBloc, TodoShowState>(
        builder: (context, state) {
          if (state is TodoShowLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoShowLoaded) {
            final todo = state.todo;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("ID: ${todo.id}", style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 10),
                      Text(todo.title, style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 10),
                      Text("Statut: ${todo.completed ? 'Complété' : 'Non complété'}"),
                      const SizedBox(height: 10),
                      Text("Utilisateur: ${todo.userId}"),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is TodoShowError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        }
      )
    );
  }
}

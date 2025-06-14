import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_layer/todo_model.dart';
import '../bloc/todo_create_bloc/todo_create_bloc.dart';
import '../bloc/todo_index_bloc/todo_index_bloc.dart';
import '../view_model/todo_create_view_model.dart';

class TodoCreateView extends StatefulWidget {
  const TodoCreateView({super.key});

  @override
  State<TodoCreateView> createState() => _TodoCreateViewState();
}

class _TodoCreateViewState extends State<TodoCreateView> {

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  bool _completed = false;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TodoCreateBloc>();
    TodoCreateViewModel(todoCreateBloc: bloc);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Create'),
      ),
      body: BlocListener<TodoCreateBloc, TodoCreateState>(
        listener: (context, state) {
          if (state is TodoCreateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Todo créé avec succès'),
                backgroundColor: Colors.green,
              ),
            );
            context.read<TodoIndexBloc>().add(LoadTodosIndex());
          } else if (state is TodoCreateError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Erreur: ${state.message}'),
                  backgroundColor: Colors.red),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Titre'),
                  validator: (value) => value == null || value.isEmpty ? 'Titre requis' : null,
                ),
                const SizedBox(height: 16),
                CheckboxListTile(
                  title: const Text('Complété ?'),
                  value: _completed,
                  onChanged: (val) {
                    setState(() {
                      _completed = val ?? false;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final newTodo = TodoModel(
                        userId: 1,
                        id: 0,
                        title: _titleController.text,
                        completed: _completed,
                      );
                      context.read<TodoCreateBloc>().add(CreateTodo(newTodo));
                    }
                  },
                  child: const Text('Créer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

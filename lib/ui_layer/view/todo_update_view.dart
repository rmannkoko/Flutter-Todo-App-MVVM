import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_layer/todo_model.dart';
import '../bloc/todo_index_bloc/todo_index_bloc.dart';
import '../bloc/todo_update_bloc/todo_update_bloc.dart';

class TodoUpdateView extends StatefulWidget {
  final TodoModel todo;
  const TodoUpdateView({super.key, required this.todo});

  @override
  State<TodoUpdateView> createState() => _TodoUpdateViewState();
}

class _TodoUpdateViewState extends State<TodoUpdateView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late bool _completed;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.todo.title);
    _completed = widget.todo.completed;
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Modifier Todo")),
      body: BlocListener<TodoUpdateBloc, TodoUpdateState>(
        listener: (BuildContext context, TodoUpdateState state) {
          if (state is TodoUpdateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Todo modifié avec succès'),
                backgroundColor: Colors.green,
              )
            );
            context.read<TodoIndexBloc>().add(LoadTodosIndex());
            Navigator.pop(context);
          } else if (state is TodoUpdateError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Erreur: ${state.message}'),
                backgroundColor: Colors.red,
              )
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
                      final updatedTodo = widget.todo.copyWith(
                        title: _titleController.text,
                        completed: _completed,
                      );
                      context.read<TodoUpdateBloc>().add(UpdateTodo(updatedTodo));
                    }
                  },
                  child: const Text('Mettre à jour'),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_crud_mvvm/data/bloc/todo_delete_bloc/todo_delete_bloc.dart';
import 'package:todoapp_crud_mvvm/data/bloc/todo_index_bloc/todo_index_bloc.dart';

import '../../data/todo_model.dart';

class TodoIndexView extends StatefulWidget {
  const TodoIndexView({super.key});

  @override
  State<TodoIndexView> createState() => _TodoIndexViewState();
}

class _TodoIndexViewState extends State<TodoIndexView> {
  String _searchQuery = '';
  List<TodoModel> _allTodos = [];

  @override
  void initState() {
    super.initState();
    context.read<TodoIndexBloc>().add(LoadTodosIndex());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Rechercher un todo...',
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.trim().toLowerCase();
                });
              },
            ),
          ),
        ),
      ),
      body: BlocConsumer<TodoDeleteBloc, TodoDeleteState>(
        listener: (context, state) {
          if (state is TodoDeleteSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Todo supprimé avec succès'),
                backgroundColor: Colors.green,
              ),
            );
            context.read<TodoIndexBloc>().add(LoadTodosIndex());
          } else if (state is TodoDeleteError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, _) {
          return BlocBuilder<TodoIndexBloc, TodoIndexState>(
            builder: (context, state) {
              if (state is TodoIndexLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is TodoIndexLoaded) {
                _allTodos = state.todos;

                final filteredTodos = _searchQuery.isEmpty
                    ? _allTodos
                    : _allTodos.where((todo) =>
                    todo.title.toLowerCase().contains(_searchQuery)).toList();

                if (filteredTodos.isEmpty) {
                  return const Center(child: Text("Aucun résultat trouvé."));
                }

                return ListView.separated(
                  itemCount: filteredTodos.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final todo = filteredTodos[index];
                    return ListTile(
                      title: Text(todo.title),
                      subtitle: Text(todo.completed ? 'Complété' : 'Non complété'),
                      onTap: () {
                        Navigator.pushNamed(context, '/todo-details', arguments: todo.id);
                      },
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              Navigator.pushNamed(context, '/todo-edit', arguments: todo);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _confirmDelete(context, todo.id),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (state is TodoIndexError) {
                return Center(child: Text(state.message));
              }
              return const SizedBox.shrink();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/todo-create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _confirmDelete(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirmation'),
        content: const Text('Voulez-vous vraiment supprimer ce todo ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              context.read<TodoDeleteBloc>().add(DeleteTodo(id));
              Navigator.pop(ctx);
            },
            child: const Text(
              'Supprimer',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}


import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todoapp_crud_mvvm/data/todo_model.dart';

class TodoUpdateService{
  
  Future<TodoModel> updateTodo(TodoModel todo) async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/${todo.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(todo.toJson()),
    );
    if (response.statusCode == 200) {
      return TodoModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update todo: ${response.statusCode} - ${response.body}');
    }
  }
}
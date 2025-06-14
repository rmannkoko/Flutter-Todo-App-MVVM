import 'dart:convert';

import 'package:http/http.dart' as http;

import '../todo_model.dart';

class TodoCreateService{

  Future<TodoModel> addTodo(TodoModel todo) async{
    final response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/todos'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(todo.toJson()),
    );
    if (response.statusCode == 201) {
      return TodoModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create todo: ${response.statusCode} - ${response.body}');
    }
  }
}
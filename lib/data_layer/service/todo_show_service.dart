import 'dart:convert';

import 'package:http/http.dart' as http;

import '../todo_model.dart';

class TodoShowService{

  Future<TodoModel> fetchTodo(int id) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'));
    if (response.statusCode == 200) {
      return TodoModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load todo: ${response.statusCode} - ${response.body}');
    }
  }
}
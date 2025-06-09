import 'dart:convert';

import 'package:http/http.dart' as http;

import '../todo_model.dart';

class TodoIndexService{

  Future<List<TodoModel>> fetchTodos() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => TodoModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load todos: ${response.statusCode} - ${response.body}');
    }
  }
}
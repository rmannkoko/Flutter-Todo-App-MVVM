import 'package:http/http.dart' as http;

class TodoDeleteService{

  Future<void> deleteTodo(int id) async {
    final response = await http.delete(Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete todo with ID $id: ${response.statusCode} - ${response.body}');
    }
  }
}
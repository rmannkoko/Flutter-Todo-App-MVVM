import '../service/todo_create_service.dart';
import '../service/todo_delete_service.dart';
import '../service/todo_index_service.dart';
import '../service/todo_show_service.dart';
import '../service/todo_update_service.dart';
import '../todo_model.dart';

class TodoRepository{
  final TodoIndexService indexService ;
  final TodoShowService showService ;
  final TodoCreateService createService ;
  final TodoUpdateService updateService ;
  final TodoDeleteService deleteService ;

  TodoRepository({
    required this.indexService,
    required this.showService,
    required this.createService,
    required this.updateService,
    required this.deleteService,
  });

  Future<List<TodoModel>> getTodos() async {
    return await indexService.fetchTodos();
  }
  Future<TodoModel> getTodoById(int id) async {
    return await showService.fetchTodo(id);
  }
  Future<TodoModel> createTodo(TodoModel todo) async {
    return await createService.addTodo(todo);
  }
  Future<TodoModel> updateTodo(TodoModel todo) async {
    return await updateService.updateTodo(todo);
  }
  Future<void> deleteTodo(int id) async {
    return await deleteService.deleteTodo(id);
  }

}
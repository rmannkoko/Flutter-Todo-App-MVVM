// test/mocks_test.dart

import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:todoapp_crud_mvvm/data_layer/service/todo_create_service.dart';
import 'package:todoapp_crud_mvvm/data_layer/service/todo_delete_service.dart';
import 'package:todoapp_crud_mvvm/data_layer/service/todo_index_service.dart';
import 'package:todoapp_crud_mvvm/data_layer/service/todo_show_service.dart';
import 'package:todoapp_crud_mvvm/data_layer/service/todo_update_service.dart';

@GenerateMocks([
  http.Client,
  TodoIndexService,
  TodoCreateService,
  TodoUpdateService,
  TodoDeleteService,
  TodoShowService,
])
void main() {

}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todoapp_crud_mvvm/data_layer/repository/todo_repository.dart';
import 'package:todoapp_crud_mvvm/main.dart';

// Crée un mock de TodoRepository
class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final mockRepo = MockTodoRepository();

    await tester.pumpWidget(MyApp(todoRepository: mockRepo));

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

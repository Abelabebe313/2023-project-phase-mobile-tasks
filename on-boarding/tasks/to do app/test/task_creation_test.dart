// test/task_creation_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/screen/createTask.dart';
import 'package:to_do_app/screen/home.dart';

void main() {
  testWidgets('Test task creation with valid input', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CreateTask(
        addTask: (Map<String, String> newTask) {
          // Test if the task is added correctly with valid input
          expect(newTask['taskName'], isNotNull);
          expect(newTask['dueDate'], isNotNull);
          expect(newTask['description'], isNotNull);
        },
      ),
    ));

    // Enter valid task details
    await tester.enterText(find.byType(TextField).at(0), 'Sample Task');
    await tester.tap(find.byIcon(Icons.calendar_today));
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).at(1), 'Sample task description');

    // Tap on the "Add Task" button
    await tester.tap(find.text('Add Task'));
    await tester.pumpAndSettle();
  });

  testWidgets('Test task creation with empty task name', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CreateTask(
        addTask: (Map<String, String> newTask) {
          // This should not be called as the task name is empty
          fail('Should not be called');
        },
      ),
    ));

    // Leave task name empty
    await tester.enterText(find.byType(TextField).at(0), '');

    // Tap on the "Add Task" button
    await tester.tap(find.text('Add Task'));
    await tester.pumpAndSettle();
  });
}

// test/task_list_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/screen/home.dart';
import 'package:to_do_app/screen/createTask.dart';

void main() {
  testWidgets('Test task list is displayed correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Home(),
    ));

    expect(find.text('Tasks list'), findsOneWidget);

  });

  testWidgets('Test task addition updates the list', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Home(),
    ));


    await tester.tap(find.text('Create task'));
    await tester.pumpAndSettle();

    // Enter valid task details and tap on the "Add Task" button
    await tester.enterText(find.byType(TextField).at(0), 'New Task');
    await tester.tap(find.text('Add Task'));
    await tester.pumpAndSettle();

    // Go back to the Home screen
    Navigator.pop(tester.element(find.byType(CreateTask))); // Navigate back

    expect(find.text('New Task'), findsOneWidget);
  });
}

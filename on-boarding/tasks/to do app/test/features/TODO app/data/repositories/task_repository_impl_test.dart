import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/features/TODO app/data/datasources/task_local_data_sources.dart';
import 'package:to_do_app/features/TODO%20app/data/models/todo_model.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late TaskLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = TaskLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('getAllTasks', () {
    test('returns a list of TaskModel when data is available', () async {
      // Arrange
      final tasksJson = [
        {
          'id': '1',
          'name': 'Task 1',
          'dueDate': '2023-08-15T00:00:00.000Z',
          'description': 'Description for Task 1',
          'isCompleted': false,
        },
        {
          'id': '2',
          'name': 'Task 2',
          'dueDate': '2023-08-16T00:00:00.000Z',
          'description': 'Description for Task 2',
          'isCompleted': true,
        },
      ];
      when(mockSharedPreferences.getString('tasks'))
          .thenReturn(json.encode(tasksJson));

      // Act
      final result = await dataSource.getAllTasks();

      // Assert
      expect(result, tasksJson.map((json) => TaskModel.fromJson(json)).toList());
    });

    test('returns an empty list when no data is available', () async {
      // Arrange
      when(mockSharedPreferences.getString('tasks')).thenReturn(null);

      // Act
      final result = await dataSource.getAllTasks();

      // Assert
      expect(result, []);
    });
  });

  // Write similar tests for other methods in TaskLocalDataSourceImpl
}



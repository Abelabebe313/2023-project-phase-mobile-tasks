import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/features/TODO app/data/models/todo_model.dart';

void main() {
  group('TaskModel', () {
    test('fromJson should return a valid model', () {
      final Map<String, dynamic> jsonMap = {
        'id': '1',
        'name': 'Buy groceries',
        'dueDate': '2023-08-15',
        'description': 'Buy milk and eggs',
        'isCompleted': false,
      };

      final result = TaskModel.fromJson(jsonMap);

      expect(result.id, '1');
      expect(result.name, 'Buy groceries');
      expect(result.dueDate, DateTime(2023, 8, 15));
      expect(result.description, 'Buy milk and eggs');
      expect(result.isCompleted, false);
    });

    test('toJson should return a JSON map containing the proper data', () {
          final taskModel = TaskModel(
            id: '1',
            name: 'Buy groceries',
            dueDate: DateTime(2023, 8, 15),
            description: 'Buy milk and eggs',
            isCompleted: false,
          );

          final result = taskModel.toJson();

          final expectedMap = {
            'id': '1',
            'name': 'Buy groceries',
            'dueDate': '2023-08-15T00:00:00.000Z',
            'description': 'Buy milk and eggs',
            'isCompleted': false,
          };
          expect(result, expectedMap);
        });


  });
}

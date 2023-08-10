import 'package:to_do_app/features/TODO app/domain/entities/task.dart';

class TaskModel extends MyTask {
  const TaskModel({
    required String id,
    required String name,
    required DateTime dueDate,
    required String description,
    bool isCompleted = false,
  }) : super(
    id: id,
    name: name,
    dueDate: dueDate,
    description: description,
    isCompleted: isCompleted,
  );

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      name: json['name'],
      dueDate: DateTime.parse(json['dueDate']),
      description: json['description'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'dueDate': dueDate.toIso8601String(),
      'description': description,
      'isCompleted': isCompleted,
    };
  }
}

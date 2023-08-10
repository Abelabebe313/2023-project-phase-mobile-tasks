import 'package:equatable/equatable.dart';

class MyTask extends Equatable {
  final String id;
  final String name;
  final DateTime dueDate;
  final String description;
  final bool isCompleted;

  const MyTask({
    required this.id,
    required this.name,
    required this.dueDate,
    required this.description,
    this.isCompleted = false,
  });

  factory MyTask.completed({
    required String id,
    required String name,
    required DateTime dueDate,
    required String description,
  }) {
    return MyTask(
      id: id,
      name: name,
      dueDate: dueDate,
      description: description,
      isCompleted: true,
    );
  }

  @override
  List<Object?> get props =>
      [id, name, dueDate, description, isCompleted];
}

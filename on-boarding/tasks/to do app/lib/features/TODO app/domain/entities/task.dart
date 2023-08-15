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

  factory MyTask.fromJson(Map<String, dynamic> json) {
    return MyTask(
      id: json['id'],
      name: json['name'],
      dueDate: DateTime.parse(json['dueDate']),
      description: json['description'],
      isCompleted: json['isCompleted'] ?? false,
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

  MyTask copyWith({
    String? id,
    String? name,
    DateTime? dueDate,
    String? description,
    bool? isCompleted,
  }) {
    return MyTask(
      id: id ?? this.id,
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props =>
      [id, name, dueDate, description, isCompleted];

}

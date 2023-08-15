import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/features/TODO app/data/models/todo_model.dart';
import '../../domain/entities/task.dart';

abstract class TaskLocalDataSource {

  Future<List<TaskModel>> getAllTasks();
  Future<TaskModel> getOneTask(String taskId);
  Future<void> addTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
  Future<void> completeTask(String taskId);
  Future<void> cacheTask(TaskModel taskToCache);

}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final SharedPreferences sharedPreferences;

  TaskLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<TaskModel>> getAllTasks() async {
    final jsonString = sharedPreferences.getString('tasks');
    if (jsonString != null) {
      final jsonList = json.decode(jsonString) as List;
      final tasks = jsonList.map((json) => TaskModel.fromJson(json)).toList();
      return tasks;
    }
    return [];
  }

  @override
  Future<TaskModel> getOneTask(String taskId) async {
    final jsonString = sharedPreferences.getString(taskId);
    if (jsonString != null) {
      final jsonMap = json.decode(jsonString);
      return TaskModel.fromJson(jsonMap);
    }
    throw Exception('Task with id $taskId not found');
  }

  @override
  Future<void> addTask(TaskModel task) async {
    final jsonString = sharedPreferences.getString('tasks');
    List<TaskModel> tasks = [];
    if (jsonString != null) {
      final jsonList = json.decode(jsonString) as List;
      tasks = jsonList.map((json) => TaskModel.fromJson(json)).toList();
    }
    tasks.add(task);
    await sharedPreferences.setString('tasks', json.encode(tasks));
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    final jsonString = sharedPreferences.getString('tasks');
    List<TaskModel> tasks = [];
    if (jsonString != null) {
      final jsonList = json.decode(jsonString) as List;
      tasks = jsonList.map((json) => TaskModel.fromJson(json)).toList();
      final index = tasks.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        tasks[index] = task;
        await sharedPreferences.setString('tasks', json.encode(tasks));
        await sharedPreferences.setString(task.id, json.encode(task.toJson()));
        return;
      }
    }
    throw Exception('Task with id ${task.id} not found');
  }

  @override
  Future<void> completeTask(String taskId) async {
    final jsonString = sharedPreferences.getString('tasks');
    List<TaskModel> tasks = [];
    if (jsonString != null) {
      final jsonList = json.decode(jsonString) as List;
      tasks = jsonList.map((json) => TaskModel.fromJson(json)).toList();
      final index = tasks.indexWhere((t) => t.id == taskId);
      if (index != -1) {
        tasks[index] = tasks[index].copyWith(isCompleted: true);
        await sharedPreferences.setString('tasks', json.encode(tasks));
        return;
      }
    }
    throw Exception('Task with id $taskId not found');
  }

  @override
  Future<void> cacheTask(TaskModel taskToCache) async {
    await sharedPreferences.setString(taskToCache.id, json.encode(taskToCache.toJson()));
  }
}

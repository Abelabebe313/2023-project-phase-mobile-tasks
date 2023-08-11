import 'package:to_do_app/features/TODO app/data/models/todo_model.dart';
import 'package:to_do_app/features/TODO%20app/domain/entities/task.dart';
abstract class TaskRemoteDataSource {
  /// calls the remote source to get All Task
  Future<TaskModel> getAllTasks();
  /// calls the remote source to get one Task
  Future<TaskModel> getOneTask(String taskId);

  /// Add new Task
  Future<void> addTask(MyTask task);

  ///update Existing Task
  Future<void> updateTask(MyTask task);

  /// After completeTask is pressed it will change the color of that task
  Future<void> completeTask(String taskId);
}
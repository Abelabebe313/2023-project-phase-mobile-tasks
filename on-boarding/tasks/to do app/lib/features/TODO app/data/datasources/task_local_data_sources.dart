import 'package:to_do_app/features/TODO%20app/data/models/todo_model.dart';

import '../../domain/entities/task.dart';

abstract class TaskLocalDataSource {

  Future<TaskModel> getAllTasks();
  /// calls the remote source to get one Task
  Future<TaskModel> getOneTask(String taskId);

  /// Add new Task
  Future<void> addTask(MyTask task);

  ///update Existing Task
  Future<void> updateTask(MyTask task);

  /// After completeTask is pressed it will change the color of that task
  Future<void> completeTask(String taskId);

  Future<void> cacheTask(TaskModel taskTOchache);

}
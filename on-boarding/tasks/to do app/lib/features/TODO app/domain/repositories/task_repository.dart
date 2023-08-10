import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/errors/task_failure.dart';
import 'package:to_do_app/features/TODO app/domain/entities/task.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<MyTask>>> getAllTasks();
  Future<Either<Failure, MyTask>> getOneTask(String taskId);
  Future<Either<Failure, void>> addTask(MyTask task);
  Future<Either<Failure, void>> updateTask(MyTask task);
  Future<Either<Failure, void>> completeTask(String taskId);
}

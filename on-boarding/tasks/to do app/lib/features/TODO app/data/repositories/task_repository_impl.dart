import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/errors/task_failure.dart';
import 'package:to_do_app/features/TODO app/domain/entities/task.dart';
import 'package:to_do_app/features/TODO app/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  @override
  Future<Either<Failure, List<MyTask>>> getAllTasks() async {
    try {
      List<MyTask> tasks = []; // Replace with actual data retrieval

      return Right(tasks);
    } catch (e) {
      return Left(DataRetrievalFailure());
    }
  }

  @override
  Future<Either<Failure, MyTask>> getOneTask(String taskId) async{
    // TODO: implement getOneTasks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> addTask(MyTask task) async {
    try {
      // TODO: Implement data addition logic to local storage

      return Right(null);
    } catch (e) {
      return Left(DataModificationFailure()); // Handle data addition error
    }
  }

  @override
  Future<Either<Failure, void>> updateTask(MyTask task) async {
    try {
      // TODO: Implement data update logic in local storage
      return Right(null);
    } catch (e) {
      return Left(DataModificationFailure()); //
    }
  }

  @override
  Future<Either<Failure, void>> completeTask(String taskId) async {
    try {
      // TODO: Implement task completion logic in local storage
      return Right(null);
    } catch (e) {
      return Left(DataModificationFailure());
    }
  }

}

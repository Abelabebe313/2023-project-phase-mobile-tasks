import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/core/errors/task_failure.dart';
import 'package:to_do_app/features/TODO app/domain/entities/task.dart';
import 'package:to_do_app/features/TODO app/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final SharedPreferences sharedPreferences;

  TaskRepositoryImpl({required this.sharedPreferences});

  @override
  Future<Either<Failure, List<MyTask>>> getAllTasks() async {
    try {
      final jsonString = sharedPreferences.getString('tasks');
      if (jsonString != null) {
        final jsonList = json.decode(jsonString) as List<dynamic>;
        final tasks = jsonList.map((jsonMap) => MyTask.fromJson(jsonMap)).toList();
        return Right(tasks);
      }
      return Right([]);
    } catch (e) {
      return Left(DataRetrievalFailure());
    }
  }

  @override
  Future<Either<Failure, MyTask>> getOneTask(String taskId) async{
    try {
      // TODO: Implement data retrieval logic using SharedPreferences
      final jsonString = sharedPreferences.getString(taskId);
      if (jsonString != null) {
        final jsonMap = json.decode(jsonString);
        final task = MyTask.fromJson(jsonMap);
        return Right(task);
      }
      return Left(DataRetrievalFailure());
    } catch (e) {
      return Left(DataRetrievalFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addTask(MyTask task) async {
    try {
      // TODO: Implement data addition logic to local storage using SharedPreferences
      await sharedPreferences.setString(task.id, json.encode(task.toJson()));
      return Right(null);
    } catch (e) {
      return Left(DataModificationFailure()); // Handle data addition error
    }
  }

  @override
  Future<Either<Failure, void>> updateTask(MyTask task) async {
    try {
      // TODO: Implement data update logic in local storage using SharedPreferences
      await sharedPreferences.setString(task.id, json.encode(task.toJson()));
      return Right(null);
    } catch (e) {
      return Left(DataModificationFailure()); //
    }
  }

  @override
  Future<Either<Failure, void>> completeTask(String taskId) async {
    try {
      // TODO: Implement task completion logic in local storage using SharedPreferences
      final jsonString = sharedPreferences.getString(taskId);
      if (jsonString != null) {
        final jsonMap = json.decode(jsonString);
        final task = MyTask.fromJson(jsonMap);
        final updatedTask = task.copyWith(isCompleted: true);
        await sharedPreferences.setString(taskId, json.encode(updatedTask.toJson()));
        return Right(null);
      }
      return Left(DataModificationFailure());
    } catch (e) {
      return Left(DataModificationFailure());
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/errors/task_failure.dart';
import 'package:to_do_app/core/usecases/usecase.dart';
import 'package:to_do_app/features/TODO app/domain/entities/task.dart';
import 'package:to_do_app/features/TODO app/domain/repositories/task_repository.dart';

class ViewAllTasks implements UseCase<List<MyTask>, NoParams> {
  final TaskRepository repository;

  ViewAllTasks(this.repository);

  @override
  Future<Either<Failure, List<MyTask>>> call(NoParams params) async {
    return await repository.getAllTasks();
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

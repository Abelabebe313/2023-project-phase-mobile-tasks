import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/errors/task_failure.dart';
import 'package:to_do_app/core/usecases/usecase.dart';
import 'package:to_do_app/features/TODO app/domain/entities/task.dart';
import 'package:to_do_app/features/TODO app/domain/repositories/task_repository.dart';

class CreateTask implements UseCase<void, MyTask> {
  final TaskRepository repository;

  CreateTask(this.repository);

  @override
  Future<Either<Failure, void>> call(MyTask task) async {
    return await repository.addTask(task);
  }
}

import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/errors/task_failure.dart';
import 'package:to_do_app/core/usecases/usecase.dart';
import 'package:to_do_app/features/TODO app/domain/entities/task.dart';
import 'package:to_do_app/features/TODO app/domain/repositories/task_repository.dart';

class ViewOneTask implements UseCase<MyTask, String> {
  final TaskRepository repository;

  ViewOneTask(this.repository);

  @override
  Future<Either<Failure, MyTask>> call(String taskId) async {
    return await repository.getOneTask(taskId);
  }
}

import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/errors/task_failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

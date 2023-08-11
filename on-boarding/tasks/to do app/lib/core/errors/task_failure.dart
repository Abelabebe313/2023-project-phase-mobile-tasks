import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List<dynamic> properties = const <dynamic>[]]) : super();
}

class ApiFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class LocalStorageFailure extends Failure {
  @override
  List<Object?> get props => [];
}
class DataRetrievalFailure extends Failure{
  @override
  List<Object?> get props => [];
}

class DataModificationFailure extends Failure{
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CacheFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
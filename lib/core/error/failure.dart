import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? errorMessage;
  final String? errorKey;

  const Failure({this.errorMessage, this.errorKey});

  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  final num? statusCode;

  const ServerFailure({super.errorMessage, this.statusCode, super.errorKey});
}

class DioFailure extends Failure {
  const DioFailure({super.errorMessage});
}

class ParsingFailure extends Failure {
  const ParsingFailure({super.errorMessage});
}

class OtherFailure extends Failure {
  const OtherFailure({super.errorMessage});
}

class CacheFailure extends Failure {
  const CacheFailure({super.errorMessage});
}

class InternetFailure extends Failure {
  const InternetFailure({super.errorMessage});
}

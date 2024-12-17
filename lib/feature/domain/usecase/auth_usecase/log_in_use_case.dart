import 'package:dartz/dartz.dart';
import 'package:rent_home/core/error/failure.dart';
import 'package:rent_home/core/usecases/usecases.dart';
import 'package:rent_home/feature/data/models/auth/response_log_in_model.dart';
import 'package:rent_home/feature/domain/repository/auth_repository/auth_repository.dart';

class LogInUseCase extends Usecases<ResponseLogInModel, LogInParams> {
  final AuthRepository authRepository;

  LogInUseCase(this.authRepository);

  @override
  Future<Either<Failure, ResponseLogInModel>> call(LogInParams prams) async {
    return await authRepository.logInUser(requestLogInModel: prams.logInModel);
  }
}

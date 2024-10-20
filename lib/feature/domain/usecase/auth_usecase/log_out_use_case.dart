import 'package:dartz/dartz.dart';
import 'package:rent_home/core/error/failure.dart';
import 'package:rent_home/core/usecases/usecases.dart';
import 'package:rent_home/feature/domain/repository/auth_repository/auth_repository.dart';

class LogOutUseCase extends Usecases<String, LogOutParams> {
  final AuthRepository authRepository;

  LogOutUseCase( this.authRepository);

  @override
  Future<Either<Failure, String>> call(LogOutParams prams) async {
    return await authRepository.logOut(email: prams.email);
  }
}

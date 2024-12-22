import 'package:dartz/dartz.dart';
import 'package:rent_home/core/error/failure.dart';
import 'package:rent_home/core/usecases/usecases.dart';
import 'package:rent_home/feature/domain/repository/auth_repository/auth_repository.dart';

class ResetPasswordUseCase extends Usecases<String, ResetPasswordParams> {
  final AuthRepository authRepository;

  ResetPasswordUseCase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(ResetPasswordParams prams) async {
    return await authRepository.resetPassword(
        requestResetPassword: prams.resetPasswordModel);
  }
}

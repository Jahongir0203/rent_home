import 'package:dartz/dartz.dart';
import 'package:rent_home/core/error/failure.dart';
import 'package:rent_home/core/usecases/usecases.dart';
import 'package:rent_home/feature/data/models/auth/response_forgot_password_model.dart';
import 'package:rent_home/feature/domain/repository/auth_repository/auth_repository.dart';

class ForgotPasswordUseCase
    extends Usecases<ResponseForgotPasswordModel, ForgotPasswordPrams> {
  final AuthRepository authRepository;

  ForgotPasswordUseCase(this.authRepository);

  @override
  Future<Either<Failure, ResponseForgotPasswordModel>> call(
      ForgotPasswordPrams prams) async {
    return await authRepository.forgotPassword(email: prams.email);
  }
}

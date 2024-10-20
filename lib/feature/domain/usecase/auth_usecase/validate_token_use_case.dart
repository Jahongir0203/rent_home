import 'package:dartz/dartz.dart';
import 'package:rent_home/core/error/failure.dart';
import 'package:rent_home/core/usecases/usecases.dart';
import 'package:rent_home/feature/domain/repository/auth_repository/auth_repository.dart';

class ValidateTokenUseCase extends Usecases<String, ValidateTokenParams> {
  final AuthRepository authRepository;

  ValidateTokenUseCase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(ValidateTokenParams prams) async {
    return await authRepository.validateToken(
        requestValidateTokenModel: prams.validateTokenModel);
  }
}

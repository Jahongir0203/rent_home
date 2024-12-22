import 'package:dartz/dartz.dart';
import 'package:rent_home/core/error/failure.dart';
import 'package:rent_home/core/usecases/usecases.dart';
import 'package:rent_home/feature/data/models/auth/response_register_model.dart';
import 'package:rent_home/feature/domain/repository/auth_repository/auth_repository.dart';

class RegisterUserUseCase extends Usecases<ResponseRegisterModel, RegisterParams> {
  final AuthRepository authRepository;

  RegisterUserUseCase(this.authRepository);

  @override
  Future<Either<Failure, ResponseRegisterModel>> call(
      RegisterParams prams) async {
    return await authRepository.registerUser(
        requestRegisterModel: prams.registerModel);
  }
}

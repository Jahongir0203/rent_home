import 'package:dartz/dartz.dart';
import 'package:rent_home/core/error/failure.dart';
import 'package:rent_home/core/usecases/usecases.dart';
import 'package:rent_home/feature/data/models/auth/response_refresh_token_model.dart';
import 'package:rent_home/feature/domain/repository/auth_repository/auth_repository.dart';

class RefreshTokenUseCase
    extends Usecases<ResponseRefreshTokenModel, RefreshTokenParams> {
  final AuthRepository authRepository;

  RefreshTokenUseCase(this.authRepository);

  @override
  Future<Either<Failure, ResponseRefreshTokenModel>> call(
      RefreshTokenParams prams) async {
    return await authRepository.refreshToken(
        requestRefreshTokenModel: prams.refreshTokenModel);
  }
}

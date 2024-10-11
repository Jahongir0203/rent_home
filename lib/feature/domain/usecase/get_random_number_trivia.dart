import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecases.dart';
import '../entities/number_trivia.dart';
import '../repository/number_trivia_repository.dart';

class GetRandomNumberTrivia implements Usecases<NumberTrivia, NoParams> {
  final NumberTriviaRepository numberTriviaRepository;

  GetRandomNumberTrivia(this.numberTriviaRepository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams prams) async {
    return await numberTriviaRepository.getRandomNumberTrivia();
  }
}

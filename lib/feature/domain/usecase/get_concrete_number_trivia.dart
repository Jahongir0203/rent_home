import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecases.dart';
import '../entities/number_trivia.dart';
import '../repository/number_trivia_repository.dart';

class GetConcreteNumberTrivia extends Usecases<NumberTrivia,Params> {
  final NumberTriviaRepository numberTriviaRepository;

  GetConcreteNumberTrivia(this.numberTriviaRepository);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async =>
      await numberTriviaRepository.getConcreteNumberTrivia(params.number);
}


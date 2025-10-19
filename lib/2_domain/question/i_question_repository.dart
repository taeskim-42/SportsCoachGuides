import 'package:dartz/dartz.dart';
import 'package:oli/2_domain/question/question.dart';

abstract class IQuestionRepository {
  Future<Either<String, List<Question>>> fetchQuestions({
    required String track,
    required int year,
  });
}

import 'package:cuy_test/core/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/auth_repository.dart';

class GetTokenUseCase implements UseCase<String, NoParams> {
  final AuthRepository authRepository;

  GetTokenUseCase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, String>> call(NoParams params,
          {Callback? callback}) =>
      authRepository.getToken();
}


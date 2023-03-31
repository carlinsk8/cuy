import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/use_case.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase implements UseCase<bool, LoginUseCaseParams> {
  final AuthRepository authRepository;

  LoginUseCase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, bool>> call(LoginUseCaseParams params,
          {Callback? callback}) =>
      authRepository.login(email: params.email, password: params.password);
}

class LoginUseCaseParams extends Equatable {
  final String email;
  final String password;

  const LoginUseCaseParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

import 'package:dartz/dartz.dart';

import 'package:cuy_test/core/error/failure.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote/auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});

  @override
  Future<Either<Failure, bool>> login({required String email, required String password}) async {
    try {
      final res = await authDataSource.login(email, password);

      return Right(res);
    } catch (e, _) {
      return const Left(UnexpectedFailure());
    }
  }

}
import 'package:dartz/dartz.dart';

import 'package:cuy_test/core/error/failure.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasources/local/user_local_data_source.dart';
import '../datasources/remote/auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  final UserLocalDataSource userLocalDataSource;

  AuthRepositoryImpl({
    required this.authDataSource,
    required this.userLocalDataSource,
  });

  @override
  Future<Either<Failure, bool>> login({required String email, required String password}) async {
    try {
      final res = await authDataSource.login(email, password);

      return Right(res);
    } catch (e, _) {
      return const Left(UnexpectedFailure());
    }
  }
  
  @override
  Future<Either<Failure, String>> getToken() async {
    try {
      final res = userLocalDataSource.getToken();
      return Right(res);
    } catch (e, _) {
      return const Left(UnexpectedFailure());
    }
  }

}
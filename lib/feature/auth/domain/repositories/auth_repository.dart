import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class AuthRepository {

  Future<Either<Failure, bool>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> getToken();

  
 
}

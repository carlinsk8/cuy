

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/plan.dart';

abstract class PlansRepository {
  Future<Either<Failure, List<Plan>>> getPlanList(String? sort);
}
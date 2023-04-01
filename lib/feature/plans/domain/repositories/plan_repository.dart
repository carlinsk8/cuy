

import 'package:cuy_test/feature/plans/domain/entities/info_device.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/plan.dart';

abstract class PlansRepository {
  Future<Either<Failure, List<Plan>>> getPlanList(String? sort);
  Future<Either<Failure, InfoDevice>> getInfoDevice();
}
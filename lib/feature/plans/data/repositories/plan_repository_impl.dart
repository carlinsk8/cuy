import 'package:dartz/dartz.dart';

import 'package:cuy_test/feature/plans/domain/entities/plan.dart';

import 'package:cuy_test/core/error/failure.dart';

import '../../domain/repositories/plan_repository.dart';
import '../datasources/plans_data_source.dart';

class PlansRepositoryImpl implements PlansRepository {

  final PlansDataSource plansDataSource;

  PlansRepositoryImpl({required this.plansDataSource});

  @override
  Future<Either<Failure, List<Plan>>> getPlanList(String? sort) async {
    try {
      final list = await plansDataSource.getPlanList(sort);
      return Right(list);
    } catch (e, _) {
      return const Left(UnauthorisedFailure());
    }
  }
}
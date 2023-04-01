import 'package:cuy_test/feature/plans/data/datasources/local/info_device_local_data_source.dart';
import 'package:cuy_test/feature/plans/domain/entities/info_device.dart';
import 'package:dartz/dartz.dart';

import 'package:cuy_test/feature/plans/domain/entities/plan.dart';

import 'package:cuy_test/core/error/failure.dart';

import '../../domain/repositories/plan_repository.dart';
import '../datasources/remote/plans_data_source.dart';

class PlansRepositoryImpl implements PlansRepository {

  final PlansDataSource plansDataSource;
  final InfoDeviceLocalDatasource infoDeviceLocalDatasource;

  PlansRepositoryImpl({
    required this.plansDataSource,
    required this.infoDeviceLocalDatasource,
  });

  @override
  Future<Either<Failure, List<Plan>>> getPlanList(String? sort) async {
    try {
      final list = await plansDataSource.getPlanList(sort);
      return Right(list);
    } catch (e) {
      return const Left(UnauthorisedFailure());
    }
  }

  @override
  Future<Either<Failure, InfoDevice>> getInfoDevice() async {
    try {
      final data = await infoDeviceLocalDatasource.getInfoDevice();
      return Right(data);
    } catch (e) {
      return const Left(UnauthorisedFailure());
    }
  }
}
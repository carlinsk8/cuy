import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/info_device.dart';
import '../repositories/plan_repository.dart';

class GetInfoDevicetUseCase implements UseCase<InfoDevice, NoParams> {
  final PlansRepository planRepository;

  GetInfoDevicetUseCase({
    required this.planRepository,
  });

  @override
  Future<Either<Failure, InfoDevice>> call(NoParams params,
          {Callback? callback}) =>
      planRepository.getInfoDevice();
}
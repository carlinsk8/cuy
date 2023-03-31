import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/plan.dart';
import '../repositories/plan_repository.dart';

class GetPlanListUseCase implements UseCase<List<Plan>, String?> {
  final PlansRepository planRepository;

  GetPlanListUseCase({
    required this.planRepository,
  });

  @override
  Future<Either<Failure, List<Plan>>> call(String? sort,
          {Callback? callback}) =>
      planRepository.getPlanList(sort);
}


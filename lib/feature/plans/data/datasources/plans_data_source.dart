import '../../../../core/api/auth_client.dart';
import '../../../../core/models/response_model.dart';
import '../../../../core/util/enviroment.dart';
import '../../domain/entities/plan.dart';
import '../models/plan_model.dart';

abstract class PlansDataSource {
  Future<List<Plan>> getPlanList(String? sort);
}

class PlansDataSourceImpl extends PlansDataSource {
  PlansDataSourceImpl({
    required this.authHttpClient,
  });

  final AuthHttpClient authHttpClient;
  String get _baseApiUrl => Env.baseUrl();
  
  @override
  Future<List<Plan>> getPlanList(String? sort) async {
    final Map<String, dynamic> queryParams = {
      'isActive': true,
    };
    queryParams['sort'] = sort ?? 'ASC';

    final authority = _baseApiUrl.replaceAll('https://', '');
    final uri = Uri.https(authority, '/api/v1/service-package', queryParams.map((key, value) => MapEntry(key, value.toString())));

    final response = await authHttpClient.getUri(uri);

    final body = ResponseModel.fromJson(response.data);

    final list = body.list as List;

    return List<PlanModel>.from(
      list.map((x) => PlanModel.fromJson(x)),
    );
  }
}
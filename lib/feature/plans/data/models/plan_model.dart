import 'package:cuy_test/feature/plans/domain/entities/plan.dart';

class PlanModel extends Plan {
  const PlanModel({
    required super.name, 
    required super.price, 
    required super.duration
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      name: json['name'],
      duration: json['duration'],
      price: (json['price'] ?? 0) * 1.0,
    );
  }
}
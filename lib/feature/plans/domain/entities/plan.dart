import 'package:equatable/equatable.dart';

class Plan extends Equatable {
  final String name;
  final double price;
  final int duration;

  const Plan({
    required this.name, 
    required this.price, 
    required this.duration
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    name,
    price,
    duration,
  ];
}
import 'package:equatable/equatable.dart';

class PoiType extends Equatable {
  final String category;
  final String kind;

  const PoiType({required this.category, required this.kind});

  @override
  List<Object> get props => [category, kind];
}

import 'package:equatable/equatable.dart';

class PoiType extends Equatable implements Comparable<PoiType> {
  final String category;
  final String kind;

  const PoiType({required this.category, required this.kind});

  @override
  List<Object> get props => [category, kind];

  @override
  int compareTo(PoiType other) {
    return "$category$kind".compareTo("${other.category}${other.kind}");
  }
}

import 'point.dart';

class ActivePoint extends Point {
  final DateTime arrival;

  ActivePoint({required point, required this.arrival})
      : super(
          latitude: point.latitude,
          longitude: point.longitude,
          height: point.height,
        );
}

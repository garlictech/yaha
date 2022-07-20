import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/utils/geometry/geocalc_js.dart';

final geoCalcProvider = Provider<GeocalcService>((ref) => GeocalcJs());

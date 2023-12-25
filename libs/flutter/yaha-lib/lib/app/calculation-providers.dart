import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/utils/geometry/geocalc_js.dart';

final geoCalcProvider = Provider<GeocalcService>((ref) => GeocalcJs());

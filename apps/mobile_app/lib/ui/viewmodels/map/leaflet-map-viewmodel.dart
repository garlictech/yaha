import 'package:functional_data/functional_data.dart';
import 'package:yaha/domain/domain.dart';

part 'leaflet-map-viewmodel.g.dart';

@FunctionalData()
class LeafletMapViewmodel extends $LeafletMapViewmodel {
  @override
  final Location? mapCenter;

  LeafletMapViewmodel({this.mapCenter});
}

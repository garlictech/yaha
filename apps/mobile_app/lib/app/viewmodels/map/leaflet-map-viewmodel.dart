import 'package:functional_data/functional_data.dart';
import 'package:yaha/domain/domain.dart';

part 'leaflet-map-viewmodel.g.dart';

@FunctionalData()
class LeafletMapViewmodel extends $LeafletMapViewmodel {
  @override
  final List<Hike> hikes;
  @override
  final List<Poi> pois;
  @override
  final Location? mapCenter;

  LeafletMapViewmodel(
      {this.hikes = const [], this.pois = const [], this.mapCenter});
}

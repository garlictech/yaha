import 'package:test/test.dart';
import 'package:yaha/entities/shared/geojson.dart';
import 'package:yaha/presenters/map/leaflet-map-presenter.dart';

void main() {
  test('Leaflet map presenter must work', () async {
    final presenter = LeafletMapPresenter();
    final geojsonData = GeoJsonData(type: "Point", coordinates: const [
      [
        [1.0, 2.0]
      ]
    ]);

    await presenter.addHikeTrack(geojsonData);
  });
}

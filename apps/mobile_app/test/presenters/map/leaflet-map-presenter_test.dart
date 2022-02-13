import 'dart:convert';

import 'package:test/test.dart';
import 'package:yaha/entities/entities.dart';
import 'package:yaha/presenters/map/leaflet-map-presenter.dart';

void main() {
  test('Map controller must be able to process a point', () async {
    var geojsonFeature = '''{
      "features": [
      {
      "type": "Feature",
      "properties": {
          "name": "Coors Field",
          "amenity": "Baseball Stadium",
          "popupContent": "This is where the Rockies play!"
      },
      "geometry": {
          "type": "Point",
          "coordinates": [-104.99404, 39.75621]
      }
          }]
    }''';

    final presenter = LeafletMapPresenter();
    await presenter.statefulMapController.fromGeoJson(geojsonFeature);
    expect(presenter.statefulMapController.markers.length, 1);
  });

  test('Map controller must be able to process a hike route', () async {
    final route = LineStringData(type: 'LineString', coordinates: [
      [0.0, 1.0]
    ]);

    final presenter = LeafletMapPresenter();
    await presenter.statefulMapController
        .fromGeoJson(route.toGeojsonFeatureString('name'), verbose: true);
    expect(presenter.statefulMapController.lines.length, 1);
  });
}

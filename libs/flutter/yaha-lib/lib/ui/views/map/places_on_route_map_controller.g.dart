// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_on_route_map_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$placesOnRouteMapControllerHash() =>
    r'39aa320cd424be3cec1017ca138435cdabb05e81';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PlacesOnRouteMapController
    extends BuildlessAutoDisposeNotifier<PlacesOnRouteMapState> {
  late final String hikeId;

  PlacesOnRouteMapState build(
    String hikeId,
  );
}

/// See also [PlacesOnRouteMapController].
@ProviderFor(PlacesOnRouteMapController)
const placesOnRouteMapControllerProvider = PlacesOnRouteMapControllerFamily();

/// See also [PlacesOnRouteMapController].
class PlacesOnRouteMapControllerFamily extends Family<PlacesOnRouteMapState> {
  /// See also [PlacesOnRouteMapController].
  const PlacesOnRouteMapControllerFamily();

  /// See also [PlacesOnRouteMapController].
  PlacesOnRouteMapControllerProvider call(
    String hikeId,
  ) {
    return PlacesOnRouteMapControllerProvider(
      hikeId,
    );
  }

  @override
  PlacesOnRouteMapControllerProvider getProviderOverride(
    covariant PlacesOnRouteMapControllerProvider provider,
  ) {
    return call(
      provider.hikeId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'placesOnRouteMapControllerProvider';
}

/// See also [PlacesOnRouteMapController].
class PlacesOnRouteMapControllerProvider
    extends AutoDisposeNotifierProviderImpl<PlacesOnRouteMapController,
        PlacesOnRouteMapState> {
  /// See also [PlacesOnRouteMapController].
  PlacesOnRouteMapControllerProvider(
    this.hikeId,
  ) : super.internal(
          () => PlacesOnRouteMapController()..hikeId = hikeId,
          from: placesOnRouteMapControllerProvider,
          name: r'placesOnRouteMapControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$placesOnRouteMapControllerHash,
          dependencies: PlacesOnRouteMapControllerFamily._dependencies,
          allTransitiveDependencies:
              PlacesOnRouteMapControllerFamily._allTransitiveDependencies,
        );

  final String hikeId;

  @override
  bool operator ==(Object other) {
    return other is PlacesOnRouteMapControllerProvider &&
        other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  PlacesOnRouteMapState runNotifierBuild(
    covariant PlacesOnRouteMapController notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_on_route_map_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$placesOnRouteMapControllerHash() =>
    r'5ea6c85a3291cdc3010f03e0ec3608b27930d7b6';

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
    extends BuildlessAutoDisposeAsyncNotifier<PlacesOnRouteMapState> {
  late final String hikeId;

  FutureOr<PlacesOnRouteMapState> build(
    String hikeId,
  );
}

/// See also [PlacesOnRouteMapController].
@ProviderFor(PlacesOnRouteMapController)
const placesOnRouteMapControllerProvider = PlacesOnRouteMapControllerFamily();

/// See also [PlacesOnRouteMapController].
class PlacesOnRouteMapControllerFamily
    extends Family<AsyncValue<PlacesOnRouteMapState>> {
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
    extends AutoDisposeAsyncNotifierProviderImpl<PlacesOnRouteMapController,
        PlacesOnRouteMapState> {
  /// See also [PlacesOnRouteMapController].
  PlacesOnRouteMapControllerProvider(
    String hikeId,
  ) : this._internal(
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
          hikeId: hikeId,
        );

  PlacesOnRouteMapControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.hikeId,
  }) : super.internal();

  final String hikeId;

  @override
  FutureOr<PlacesOnRouteMapState> runNotifierBuild(
    covariant PlacesOnRouteMapController notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }

  @override
  Override overrideWith(PlacesOnRouteMapController Function() create) {
    return ProviderOverride(
      origin: this,
      override: PlacesOnRouteMapControllerProvider._internal(
        () => create()..hikeId = hikeId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        hikeId: hikeId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PlacesOnRouteMapController,
      PlacesOnRouteMapState> createElement() {
    return _PlacesOnRouteMapControllerProviderElement(this);
  }

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
}

mixin PlacesOnRouteMapControllerRef
    on AutoDisposeAsyncNotifierProviderRef<PlacesOnRouteMapState> {
  /// The parameter `hikeId` of this provider.
  String get hikeId;
}

class _PlacesOnRouteMapControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PlacesOnRouteMapController,
        PlacesOnRouteMapState> with PlacesOnRouteMapControllerRef {
  _PlacesOnRouteMapControllerProviderElement(super.provider);

  @override
  String get hikeId => (origin as PlacesOnRouteMapControllerProvider).hikeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

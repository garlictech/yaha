// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distance_markers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$distanceMarkersHash() => r'c11e8ee94cd756c2b62a15c7b4c9549e0a8f9f77';

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

abstract class _$DistanceMarkers
    extends BuildlessAutoDisposeAsyncNotifier<List<Marker>> {
  late final String hikeId;

  FutureOr<List<Marker>> build(
    String hikeId,
  );
}

/// See also [DistanceMarkers].
@ProviderFor(DistanceMarkers)
const distanceMarkersProvider = DistanceMarkersFamily();

/// See also [DistanceMarkers].
class DistanceMarkersFamily extends Family<AsyncValue<List<Marker>>> {
  /// See also [DistanceMarkers].
  const DistanceMarkersFamily();

  /// See also [DistanceMarkers].
  DistanceMarkersProvider call(
    String hikeId,
  ) {
    return DistanceMarkersProvider(
      hikeId,
    );
  }

  @override
  DistanceMarkersProvider getProviderOverride(
    covariant DistanceMarkersProvider provider,
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
  String? get name => r'distanceMarkersProvider';
}

/// See also [DistanceMarkers].
class DistanceMarkersProvider extends AutoDisposeAsyncNotifierProviderImpl<
    DistanceMarkers, List<Marker>> {
  /// See also [DistanceMarkers].
  DistanceMarkersProvider(
    String hikeId,
  ) : this._internal(
          () => DistanceMarkers()..hikeId = hikeId,
          from: distanceMarkersProvider,
          name: r'distanceMarkersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$distanceMarkersHash,
          dependencies: DistanceMarkersFamily._dependencies,
          allTransitiveDependencies:
              DistanceMarkersFamily._allTransitiveDependencies,
          hikeId: hikeId,
        );

  DistanceMarkersProvider._internal(
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
  FutureOr<List<Marker>> runNotifierBuild(
    covariant DistanceMarkers notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }

  @override
  Override overrideWith(DistanceMarkers Function() create) {
    return ProviderOverride(
      origin: this,
      override: DistanceMarkersProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<DistanceMarkers, List<Marker>>
      createElement() {
    return _DistanceMarkersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DistanceMarkersProvider && other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DistanceMarkersRef on AutoDisposeAsyncNotifierProviderRef<List<Marker>> {
  /// The parameter `hikeId` of this provider.
  String get hikeId;
}

class _DistanceMarkersProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DistanceMarkers,
        List<Marker>> with DistanceMarkersRef {
  _DistanceMarkersProviderElement(super.provider);

  @override
  String get hikeId => (origin as DistanceMarkersProvider).hikeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

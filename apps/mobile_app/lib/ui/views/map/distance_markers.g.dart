// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distance_markers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$distanceMarkersHash() => r'def63f2f54e97df772a35dfeaacd3d0adfcd91f4';

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
    extends BuildlessAutoDisposeNotifier<List<Marker>> {
  late final String hikeId;

  List<Marker> build(
    String hikeId,
  );
}

/// See also [DistanceMarkers].
@ProviderFor(DistanceMarkers)
const distanceMarkersProvider = DistanceMarkersFamily();

/// See also [DistanceMarkers].
class DistanceMarkersFamily extends Family<List<Marker>> {
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
class DistanceMarkersProvider
    extends AutoDisposeNotifierProviderImpl<DistanceMarkers, List<Marker>> {
  /// See also [DistanceMarkers].
  DistanceMarkersProvider(
    this.hikeId,
  ) : super.internal(
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
        );

  final String hikeId;

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

  @override
  List<Marker> runNotifierBuild(
    covariant DistanceMarkers notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

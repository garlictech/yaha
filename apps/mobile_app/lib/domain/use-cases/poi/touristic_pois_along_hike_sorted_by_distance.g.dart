// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'touristic_pois_along_hike_sorted_by_distance.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$touristicPoisAlongHikeSortedByDistanceHash() =>
    r'7cb9ec1a298e5356cd2a941a399222e223e19c71';

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

abstract class _$TouristicPoisAlongHikeSortedByDistance
    extends BuildlessAutoDisposeNotifier<List<PoiOfHike>> {
  late final String hikeId;

  List<PoiOfHike> build(
    String hikeId,
  );
}

/// See also [TouristicPoisAlongHikeSortedByDistance].
@ProviderFor(TouristicPoisAlongHikeSortedByDistance)
const touristicPoisAlongHikeSortedByDistanceProvider =
    TouristicPoisAlongHikeSortedByDistanceFamily();

/// See also [TouristicPoisAlongHikeSortedByDistance].
class TouristicPoisAlongHikeSortedByDistanceFamily
    extends Family<List<PoiOfHike>> {
  /// See also [TouristicPoisAlongHikeSortedByDistance].
  const TouristicPoisAlongHikeSortedByDistanceFamily();

  /// See also [TouristicPoisAlongHikeSortedByDistance].
  TouristicPoisAlongHikeSortedByDistanceProvider call(
    String hikeId,
  ) {
    return TouristicPoisAlongHikeSortedByDistanceProvider(
      hikeId,
    );
  }

  @override
  TouristicPoisAlongHikeSortedByDistanceProvider getProviderOverride(
    covariant TouristicPoisAlongHikeSortedByDistanceProvider provider,
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
  String? get name => r'touristicPoisAlongHikeSortedByDistanceProvider';
}

/// See also [TouristicPoisAlongHikeSortedByDistance].
class TouristicPoisAlongHikeSortedByDistanceProvider
    extends AutoDisposeNotifierProviderImpl<
        TouristicPoisAlongHikeSortedByDistance, List<PoiOfHike>> {
  /// See also [TouristicPoisAlongHikeSortedByDistance].
  TouristicPoisAlongHikeSortedByDistanceProvider(
    this.hikeId,
  ) : super.internal(
          () => TouristicPoisAlongHikeSortedByDistance()..hikeId = hikeId,
          from: touristicPoisAlongHikeSortedByDistanceProvider,
          name: r'touristicPoisAlongHikeSortedByDistanceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$touristicPoisAlongHikeSortedByDistanceHash,
          dependencies:
              TouristicPoisAlongHikeSortedByDistanceFamily._dependencies,
          allTransitiveDependencies:
              TouristicPoisAlongHikeSortedByDistanceFamily
                  ._allTransitiveDependencies,
        );

  final String hikeId;

  @override
  bool operator ==(Object other) {
    return other is TouristicPoisAlongHikeSortedByDistanceProvider &&
        other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  List<PoiOfHike> runNotifierBuild(
    covariant TouristicPoisAlongHikeSortedByDistance notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

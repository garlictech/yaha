// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_touristic_pois_along_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$randomTouristicPoisAlongHikeHash() =>
    r'31d982c24f5caa531feb49611bb465d1ea3f6fe9';

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

abstract class _$RandomTouristicPoisAlongHike
    extends BuildlessAutoDisposeNotifier<LoadableState<List<PoiOfHike>>> {
  late final String hikeId;

  LoadableState<List<PoiOfHike>> build(
    String hikeId,
  );
}

/// See also [RandomTouristicPoisAlongHike].
@ProviderFor(RandomTouristicPoisAlongHike)
const randomTouristicPoisAlongHikeProvider =
    RandomTouristicPoisAlongHikeFamily();

/// See also [RandomTouristicPoisAlongHike].
class RandomTouristicPoisAlongHikeFamily
    extends Family<LoadableState<List<PoiOfHike>>> {
  /// See also [RandomTouristicPoisAlongHike].
  const RandomTouristicPoisAlongHikeFamily();

  /// See also [RandomTouristicPoisAlongHike].
  RandomTouristicPoisAlongHikeProvider call(
    String hikeId,
  ) {
    return RandomTouristicPoisAlongHikeProvider(
      hikeId,
    );
  }

  @override
  RandomTouristicPoisAlongHikeProvider getProviderOverride(
    covariant RandomTouristicPoisAlongHikeProvider provider,
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
  String? get name => r'randomTouristicPoisAlongHikeProvider';
}

/// See also [RandomTouristicPoisAlongHike].
class RandomTouristicPoisAlongHikeProvider
    extends AutoDisposeNotifierProviderImpl<RandomTouristicPoisAlongHike,
        LoadableState<List<PoiOfHike>>> {
  /// See also [RandomTouristicPoisAlongHike].
  RandomTouristicPoisAlongHikeProvider(
    this.hikeId,
  ) : super.internal(
          () => RandomTouristicPoisAlongHike()..hikeId = hikeId,
          from: randomTouristicPoisAlongHikeProvider,
          name: r'randomTouristicPoisAlongHikeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$randomTouristicPoisAlongHikeHash,
          dependencies: RandomTouristicPoisAlongHikeFamily._dependencies,
          allTransitiveDependencies:
              RandomTouristicPoisAlongHikeFamily._allTransitiveDependencies,
        );

  final String hikeId;

  @override
  bool operator ==(Object other) {
    return other is RandomTouristicPoisAlongHikeProvider &&
        other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  LoadableState<List<PoiOfHike>> runNotifierBuild(
    covariant RandomTouristicPoisAlongHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

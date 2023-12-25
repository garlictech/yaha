// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_pois_around_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredPoisAroundHikeHash() =>
    r'999813eb327570ef4bd5f200228bcde7878f351f';

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

abstract class _$FilteredPoisAroundHike
    extends BuildlessAutoDisposeNotifier<LoadableState<List<Poi>>> {
  late final String hikeId;

  LoadableState<List<Poi>> build(
    String hikeId,
  );
}

/// See also [FilteredPoisAroundHike].
@ProviderFor(FilteredPoisAroundHike)
const filteredPoisAroundHikeProvider = FilteredPoisAroundHikeFamily();

/// See also [FilteredPoisAroundHike].
class FilteredPoisAroundHikeFamily extends Family<LoadableState<List<Poi>>> {
  /// See also [FilteredPoisAroundHike].
  const FilteredPoisAroundHikeFamily();

  /// See also [FilteredPoisAroundHike].
  FilteredPoisAroundHikeProvider call(
    String hikeId,
  ) {
    return FilteredPoisAroundHikeProvider(
      hikeId,
    );
  }

  @override
  FilteredPoisAroundHikeProvider getProviderOverride(
    covariant FilteredPoisAroundHikeProvider provider,
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
  String? get name => r'filteredPoisAroundHikeProvider';
}

/// See also [FilteredPoisAroundHike].
class FilteredPoisAroundHikeProvider extends AutoDisposeNotifierProviderImpl<
    FilteredPoisAroundHike, LoadableState<List<Poi>>> {
  /// See also [FilteredPoisAroundHike].
  FilteredPoisAroundHikeProvider(
    this.hikeId,
  ) : super.internal(
          () => FilteredPoisAroundHike()..hikeId = hikeId,
          from: filteredPoisAroundHikeProvider,
          name: r'filteredPoisAroundHikeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredPoisAroundHikeHash,
          dependencies: FilteredPoisAroundHikeFamily._dependencies,
          allTransitiveDependencies:
              FilteredPoisAroundHikeFamily._allTransitiveDependencies,
        );

  final String hikeId;

  @override
  bool operator ==(Object other) {
    return other is FilteredPoisAroundHikeProvider && other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  LoadableState<List<Poi>> runNotifierBuild(
    covariant FilteredPoisAroundHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

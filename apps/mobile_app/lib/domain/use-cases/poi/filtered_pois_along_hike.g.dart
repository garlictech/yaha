// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_pois_along_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredPoisAlongHikeHash() =>
    r'a2c53662e17c84dba4eea95cb9ff080e5497c76d';

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

abstract class _$FilteredPoisAlongHike
    extends BuildlessAutoDisposeNotifier<List<PoiOfHike>> {
  late final String hikeId;

  List<PoiOfHike> build(
    String hikeId,
  );
}

/// See also [FilteredPoisAlongHike].
@ProviderFor(FilteredPoisAlongHike)
const filteredPoisAlongHikeProvider = FilteredPoisAlongHikeFamily();

/// See also [FilteredPoisAlongHike].
class FilteredPoisAlongHikeFamily extends Family<List<PoiOfHike>> {
  /// See also [FilteredPoisAlongHike].
  const FilteredPoisAlongHikeFamily();

  /// See also [FilteredPoisAlongHike].
  FilteredPoisAlongHikeProvider call(
    String hikeId,
  ) {
    return FilteredPoisAlongHikeProvider(
      hikeId,
    );
  }

  @override
  FilteredPoisAlongHikeProvider getProviderOverride(
    covariant FilteredPoisAlongHikeProvider provider,
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
  String? get name => r'filteredPoisAlongHikeProvider';
}

/// See also [FilteredPoisAlongHike].
class FilteredPoisAlongHikeProvider extends AutoDisposeNotifierProviderImpl<
    FilteredPoisAlongHike, List<PoiOfHike>> {
  /// See also [FilteredPoisAlongHike].
  FilteredPoisAlongHikeProvider(
    this.hikeId,
  ) : super.internal(
          () => FilteredPoisAlongHike()..hikeId = hikeId,
          from: filteredPoisAlongHikeProvider,
          name: r'filteredPoisAlongHikeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredPoisAlongHikeHash,
          dependencies: FilteredPoisAlongHikeFamily._dependencies,
          allTransitiveDependencies:
              FilteredPoisAlongHikeFamily._allTransitiveDependencies,
        );

  final String hikeId;

  @override
  bool operator ==(Object other) {
    return other is FilteredPoisAlongHikeProvider && other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  List<PoiOfHike> runNotifierBuild(
    covariant FilteredPoisAlongHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_pois_around_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredPoisAroundHikeHash() =>
    r'1af9e07c7c01718966f33911f32a3dc1f321ae18';

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
    extends BuildlessAutoDisposeAsyncNotifier<List<PoiEntity>> {
  late final String hikeId;

  FutureOr<List<PoiEntity>> build(
    String hikeId,
  );
}

/// See also [FilteredPoisAroundHike].
@ProviderFor(FilteredPoisAroundHike)
const filteredPoisAroundHikeProvider = FilteredPoisAroundHikeFamily();

/// See also [FilteredPoisAroundHike].
class FilteredPoisAroundHikeFamily extends Family<AsyncValue<List<PoiEntity>>> {
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
class FilteredPoisAroundHikeProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FilteredPoisAroundHike,
        List<PoiEntity>> {
  /// See also [FilteredPoisAroundHike].
  FilteredPoisAroundHikeProvider(
    String hikeId,
  ) : this._internal(
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
          hikeId: hikeId,
        );

  FilteredPoisAroundHikeProvider._internal(
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
  FutureOr<List<PoiEntity>> runNotifierBuild(
    covariant FilteredPoisAroundHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }

  @override
  Override overrideWith(FilteredPoisAroundHike Function() create) {
    return ProviderOverride(
      origin: this,
      override: FilteredPoisAroundHikeProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<FilteredPoisAroundHike,
      List<PoiEntity>> createElement() {
    return _FilteredPoisAroundHikeProviderElement(this);
  }

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
}

mixin FilteredPoisAroundHikeRef
    on AutoDisposeAsyncNotifierProviderRef<List<PoiEntity>> {
  /// The parameter `hikeId` of this provider.
  String get hikeId;
}

class _FilteredPoisAroundHikeProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FilteredPoisAroundHike,
        List<PoiEntity>> with FilteredPoisAroundHikeRef {
  _FilteredPoisAroundHikeProviderElement(super.provider);

  @override
  String get hikeId => (origin as FilteredPoisAroundHikeProvider).hikeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

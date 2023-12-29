// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_pois_along_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredPoisAlongHikeHash() =>
    r'9ca31bb4bb15b9ee8b4ba6a4c4ed3289b494d6b0';

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
    extends BuildlessAutoDisposeAsyncNotifier<List<PoiOfHikeEntity>> {
  late final String hikeId;

  FutureOr<List<PoiOfHikeEntity>> build(
    String hikeId,
  );
}

/// See also [FilteredPoisAlongHike].
@ProviderFor(FilteredPoisAlongHike)
const filteredPoisAlongHikeProvider = FilteredPoisAlongHikeFamily();

/// See also [FilteredPoisAlongHike].
class FilteredPoisAlongHikeFamily
    extends Family<AsyncValue<List<PoiOfHikeEntity>>> {
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
class FilteredPoisAlongHikeProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FilteredPoisAlongHike,
        List<PoiOfHikeEntity>> {
  /// See also [FilteredPoisAlongHike].
  FilteredPoisAlongHikeProvider(
    String hikeId,
  ) : this._internal(
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
          hikeId: hikeId,
        );

  FilteredPoisAlongHikeProvider._internal(
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
  FutureOr<List<PoiOfHikeEntity>> runNotifierBuild(
    covariant FilteredPoisAlongHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }

  @override
  Override overrideWith(FilteredPoisAlongHike Function() create) {
    return ProviderOverride(
      origin: this,
      override: FilteredPoisAlongHikeProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<FilteredPoisAlongHike,
      List<PoiOfHikeEntity>> createElement() {
    return _FilteredPoisAlongHikeProviderElement(this);
  }

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
}

mixin FilteredPoisAlongHikeRef
    on AutoDisposeAsyncNotifierProviderRef<List<PoiOfHikeEntity>> {
  /// The parameter `hikeId` of this provider.
  String get hikeId;
}

class _FilteredPoisAlongHikeProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FilteredPoisAlongHike,
        List<PoiOfHikeEntity>> with FilteredPoisAlongHikeRef {
  _FilteredPoisAlongHikeProviderElement(super.provider);

  @override
  String get hikeId => (origin as FilteredPoisAlongHikeProvider).hikeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

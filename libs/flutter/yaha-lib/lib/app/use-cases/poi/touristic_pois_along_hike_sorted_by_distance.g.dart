// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'touristic_pois_along_hike_sorted_by_distance.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$touristicPoisAlongHikeSortedByDistanceHash() =>
    r'8c88a65f5bcb416c7b4e6dc753e225e3064c3856';

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
    extends BuildlessAutoDisposeAsyncNotifier<List<PoiOfHikeEntity>> {
  late final String hikeId;

  FutureOr<List<PoiOfHikeEntity>> build(
    String hikeId,
  );
}

/// See also [TouristicPoisAlongHikeSortedByDistance].
@ProviderFor(TouristicPoisAlongHikeSortedByDistance)
const touristicPoisAlongHikeSortedByDistanceProvider =
    TouristicPoisAlongHikeSortedByDistanceFamily();

/// See also [TouristicPoisAlongHikeSortedByDistance].
class TouristicPoisAlongHikeSortedByDistanceFamily
    extends Family<AsyncValue<List<PoiOfHikeEntity>>> {
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
    extends AutoDisposeAsyncNotifierProviderImpl<
        TouristicPoisAlongHikeSortedByDistance, List<PoiOfHikeEntity>> {
  /// See also [TouristicPoisAlongHikeSortedByDistance].
  TouristicPoisAlongHikeSortedByDistanceProvider(
    String hikeId,
  ) : this._internal(
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
          hikeId: hikeId,
        );

  TouristicPoisAlongHikeSortedByDistanceProvider._internal(
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
    covariant TouristicPoisAlongHikeSortedByDistance notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }

  @override
  Override overrideWith(
      TouristicPoisAlongHikeSortedByDistance Function() create) {
    return ProviderOverride(
      origin: this,
      override: TouristicPoisAlongHikeSortedByDistanceProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<
      TouristicPoisAlongHikeSortedByDistance,
      List<PoiOfHikeEntity>> createElement() {
    return _TouristicPoisAlongHikeSortedByDistanceProviderElement(this);
  }

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
}

mixin TouristicPoisAlongHikeSortedByDistanceRef
    on AutoDisposeAsyncNotifierProviderRef<List<PoiOfHikeEntity>> {
  /// The parameter `hikeId` of this provider.
  String get hikeId;
}

class _TouristicPoisAlongHikeSortedByDistanceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        TouristicPoisAlongHikeSortedByDistance,
        List<PoiOfHikeEntity>> with TouristicPoisAlongHikeSortedByDistanceRef {
  _TouristicPoisAlongHikeSortedByDistanceProviderElement(super.provider);

  @override
  String get hikeId =>
      (origin as TouristicPoisAlongHikeSortedByDistanceProvider).hikeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

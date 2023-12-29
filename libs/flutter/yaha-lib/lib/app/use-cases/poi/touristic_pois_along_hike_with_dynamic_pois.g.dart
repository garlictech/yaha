// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'touristic_pois_along_hike_with_dynamic_pois.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$touristicPoisAlongHikeWithDynamicPoisHash() =>
    r'227429d514f65f6f8511537073a040e5db2f9b86';

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

abstract class _$TouristicPoisAlongHikeWithDynamicPois
    extends BuildlessAutoDisposeAsyncNotifier<List<PoiOfHikeEntity>> {
  late final String hikeId;

  FutureOr<List<PoiOfHikeEntity>> build(
    String hikeId,
  );
}

/// See also [TouristicPoisAlongHikeWithDynamicPois].
@ProviderFor(TouristicPoisAlongHikeWithDynamicPois)
const touristicPoisAlongHikeWithDynamicPoisProvider =
    TouristicPoisAlongHikeWithDynamicPoisFamily();

/// See also [TouristicPoisAlongHikeWithDynamicPois].
class TouristicPoisAlongHikeWithDynamicPoisFamily
    extends Family<AsyncValue<List<PoiOfHikeEntity>>> {
  /// See also [TouristicPoisAlongHikeWithDynamicPois].
  const TouristicPoisAlongHikeWithDynamicPoisFamily();

  /// See also [TouristicPoisAlongHikeWithDynamicPois].
  TouristicPoisAlongHikeWithDynamicPoisProvider call(
    String hikeId,
  ) {
    return TouristicPoisAlongHikeWithDynamicPoisProvider(
      hikeId,
    );
  }

  @override
  TouristicPoisAlongHikeWithDynamicPoisProvider getProviderOverride(
    covariant TouristicPoisAlongHikeWithDynamicPoisProvider provider,
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
  String? get name => r'touristicPoisAlongHikeWithDynamicPoisProvider';
}

/// See also [TouristicPoisAlongHikeWithDynamicPois].
class TouristicPoisAlongHikeWithDynamicPoisProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        TouristicPoisAlongHikeWithDynamicPois, List<PoiOfHikeEntity>> {
  /// See also [TouristicPoisAlongHikeWithDynamicPois].
  TouristicPoisAlongHikeWithDynamicPoisProvider(
    String hikeId,
  ) : this._internal(
          () => TouristicPoisAlongHikeWithDynamicPois()..hikeId = hikeId,
          from: touristicPoisAlongHikeWithDynamicPoisProvider,
          name: r'touristicPoisAlongHikeWithDynamicPoisProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$touristicPoisAlongHikeWithDynamicPoisHash,
          dependencies:
              TouristicPoisAlongHikeWithDynamicPoisFamily._dependencies,
          allTransitiveDependencies: TouristicPoisAlongHikeWithDynamicPoisFamily
              ._allTransitiveDependencies,
          hikeId: hikeId,
        );

  TouristicPoisAlongHikeWithDynamicPoisProvider._internal(
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
    covariant TouristicPoisAlongHikeWithDynamicPois notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }

  @override
  Override overrideWith(
      TouristicPoisAlongHikeWithDynamicPois Function() create) {
    return ProviderOverride(
      origin: this,
      override: TouristicPoisAlongHikeWithDynamicPoisProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<TouristicPoisAlongHikeWithDynamicPois,
      List<PoiOfHikeEntity>> createElement() {
    return _TouristicPoisAlongHikeWithDynamicPoisProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TouristicPoisAlongHikeWithDynamicPoisProvider &&
        other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TouristicPoisAlongHikeWithDynamicPoisRef
    on AutoDisposeAsyncNotifierProviderRef<List<PoiOfHikeEntity>> {
  /// The parameter `hikeId` of this provider.
  String get hikeId;
}

class _TouristicPoisAlongHikeWithDynamicPoisProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        TouristicPoisAlongHikeWithDynamicPois,
        List<PoiOfHikeEntity>> with TouristicPoisAlongHikeWithDynamicPoisRef {
  _TouristicPoisAlongHikeWithDynamicPoisProviderElement(super.provider);

  @override
  String get hikeId =>
      (origin as TouristicPoisAlongHikeWithDynamicPoisProvider).hikeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'touristic_pois_along_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$touristicPoisAlongHikeHash() =>
    r'6de4060556681228eaa32b0a158ccdfbe64d390a';

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

abstract class _$TouristicPoisAlongHike
    extends BuildlessAutoDisposeAsyncNotifier<List<PoiOfHikeEntity>> {
  late final String hikeId;

  FutureOr<List<PoiOfHikeEntity>> build(
    String hikeId,
  );
}

/// See also [TouristicPoisAlongHike].
@ProviderFor(TouristicPoisAlongHike)
const touristicPoisAlongHikeProvider = TouristicPoisAlongHikeFamily();

/// See also [TouristicPoisAlongHike].
class TouristicPoisAlongHikeFamily
    extends Family<AsyncValue<List<PoiOfHikeEntity>>> {
  /// See also [TouristicPoisAlongHike].
  const TouristicPoisAlongHikeFamily();

  /// See also [TouristicPoisAlongHike].
  TouristicPoisAlongHikeProvider call(
    String hikeId,
  ) {
    return TouristicPoisAlongHikeProvider(
      hikeId,
    );
  }

  @override
  TouristicPoisAlongHikeProvider getProviderOverride(
    covariant TouristicPoisAlongHikeProvider provider,
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
  String? get name => r'touristicPoisAlongHikeProvider';
}

/// See also [TouristicPoisAlongHike].
class TouristicPoisAlongHikeProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TouristicPoisAlongHike,
        List<PoiOfHikeEntity>> {
  /// See also [TouristicPoisAlongHike].
  TouristicPoisAlongHikeProvider(
    String hikeId,
  ) : this._internal(
          () => TouristicPoisAlongHike()..hikeId = hikeId,
          from: touristicPoisAlongHikeProvider,
          name: r'touristicPoisAlongHikeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$touristicPoisAlongHikeHash,
          dependencies: TouristicPoisAlongHikeFamily._dependencies,
          allTransitiveDependencies:
              TouristicPoisAlongHikeFamily._allTransitiveDependencies,
          hikeId: hikeId,
        );

  TouristicPoisAlongHikeProvider._internal(
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
    covariant TouristicPoisAlongHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }

  @override
  Override overrideWith(TouristicPoisAlongHike Function() create) {
    return ProviderOverride(
      origin: this,
      override: TouristicPoisAlongHikeProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<TouristicPoisAlongHike,
      List<PoiOfHikeEntity>> createElement() {
    return _TouristicPoisAlongHikeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TouristicPoisAlongHikeProvider && other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TouristicPoisAlongHikeRef
    on AutoDisposeAsyncNotifierProviderRef<List<PoiOfHikeEntity>> {
  /// The parameter `hikeId` of this provider.
  String get hikeId;
}

class _TouristicPoisAlongHikeProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TouristicPoisAlongHike,
        List<PoiOfHikeEntity>> with TouristicPoisAlongHikeRef {
  _TouristicPoisAlongHikeProviderElement(super.provider);

  @override
  String get hikeId => (origin as TouristicPoisAlongHikeProvider).hikeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

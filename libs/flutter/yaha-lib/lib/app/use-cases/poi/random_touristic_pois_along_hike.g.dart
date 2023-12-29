// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_touristic_pois_along_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$randomTouristicPoisAlongHikeHash() =>
    r'89b7b544d2f28320657b2c411b1efe1da92fca09';

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
    extends BuildlessAutoDisposeAsyncNotifier<List<PoiOfHikeEntity>> {
  late final String hikeId;

  FutureOr<List<PoiOfHikeEntity>> build(
    String hikeId,
  );
}

/// See also [RandomTouristicPoisAlongHike].
@ProviderFor(RandomTouristicPoisAlongHike)
const randomTouristicPoisAlongHikeProvider =
    RandomTouristicPoisAlongHikeFamily();

/// See also [RandomTouristicPoisAlongHike].
class RandomTouristicPoisAlongHikeFamily
    extends Family<AsyncValue<List<PoiOfHikeEntity>>> {
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
    extends AutoDisposeAsyncNotifierProviderImpl<RandomTouristicPoisAlongHike,
        List<PoiOfHikeEntity>> {
  /// See also [RandomTouristicPoisAlongHike].
  RandomTouristicPoisAlongHikeProvider(
    String hikeId,
  ) : this._internal(
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
          hikeId: hikeId,
        );

  RandomTouristicPoisAlongHikeProvider._internal(
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
    covariant RandomTouristicPoisAlongHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }

  @override
  Override overrideWith(RandomTouristicPoisAlongHike Function() create) {
    return ProviderOverride(
      origin: this,
      override: RandomTouristicPoisAlongHikeProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<RandomTouristicPoisAlongHike,
      List<PoiOfHikeEntity>> createElement() {
    return _RandomTouristicPoisAlongHikeProviderElement(this);
  }

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
}

mixin RandomTouristicPoisAlongHikeRef
    on AutoDisposeAsyncNotifierProviderRef<List<PoiOfHikeEntity>> {
  /// The parameter `hikeId` of this provider.
  String get hikeId;
}

class _RandomTouristicPoisAlongHikeProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        RandomTouristicPoisAlongHike,
        List<PoiOfHikeEntity>> with RandomTouristicPoisAlongHikeRef {
  _RandomTouristicPoisAlongHikeProviderElement(super.provider);

  @override
  String get hikeId => (origin as RandomTouristicPoisAlongHikeProvider).hikeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

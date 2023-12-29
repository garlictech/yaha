// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'touristic_pois_around_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$touristicPoisAroundHikeHash() =>
    r'7fb0cb651547c601e7ba109d8e17257fe39412f8';

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

abstract class _$TouristicPoisAroundHike
    extends BuildlessAutoDisposeAsyncNotifier<List<PoiEntity>> {
  late final String hikeId;

  FutureOr<List<PoiEntity>> build(
    String hikeId,
  );
}

/// See also [TouristicPoisAroundHike].
@ProviderFor(TouristicPoisAroundHike)
const touristicPoisAroundHikeProvider = TouristicPoisAroundHikeFamily();

/// See also [TouristicPoisAroundHike].
class TouristicPoisAroundHikeFamily
    extends Family<AsyncValue<List<PoiEntity>>> {
  /// See also [TouristicPoisAroundHike].
  const TouristicPoisAroundHikeFamily();

  /// See also [TouristicPoisAroundHike].
  TouristicPoisAroundHikeProvider call(
    String hikeId,
  ) {
    return TouristicPoisAroundHikeProvider(
      hikeId,
    );
  }

  @override
  TouristicPoisAroundHikeProvider getProviderOverride(
    covariant TouristicPoisAroundHikeProvider provider,
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
  String? get name => r'touristicPoisAroundHikeProvider';
}

/// See also [TouristicPoisAroundHike].
class TouristicPoisAroundHikeProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TouristicPoisAroundHike,
        List<PoiEntity>> {
  /// See also [TouristicPoisAroundHike].
  TouristicPoisAroundHikeProvider(
    String hikeId,
  ) : this._internal(
          () => TouristicPoisAroundHike()..hikeId = hikeId,
          from: touristicPoisAroundHikeProvider,
          name: r'touristicPoisAroundHikeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$touristicPoisAroundHikeHash,
          dependencies: TouristicPoisAroundHikeFamily._dependencies,
          allTransitiveDependencies:
              TouristicPoisAroundHikeFamily._allTransitiveDependencies,
          hikeId: hikeId,
        );

  TouristicPoisAroundHikeProvider._internal(
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
    covariant TouristicPoisAroundHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }

  @override
  Override overrideWith(TouristicPoisAroundHike Function() create) {
    return ProviderOverride(
      origin: this,
      override: TouristicPoisAroundHikeProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<TouristicPoisAroundHike,
      List<PoiEntity>> createElement() {
    return _TouristicPoisAroundHikeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TouristicPoisAroundHikeProvider && other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TouristicPoisAroundHikeRef
    on AutoDisposeAsyncNotifierProviderRef<List<PoiEntity>> {
  /// The parameter `hikeId` of this provider.
  String get hikeId;
}

class _TouristicPoisAroundHikeProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TouristicPoisAroundHike,
        List<PoiEntity>> with TouristicPoisAroundHikeRef {
  _TouristicPoisAroundHikeProviderElement(super.provider);

  @override
  String get hikeId => (origin as TouristicPoisAroundHikeProvider).hikeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

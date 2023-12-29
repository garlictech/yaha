// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pois_around_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$poisAroundHikeHash() => r'35fb7b7154c00876ad227c0503d64d2a74fa0689';

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

abstract class _$PoisAroundHike
    extends BuildlessAutoDisposeAsyncNotifier<List<PoiEntity>> {
  late final String hikeId;

  FutureOr<List<PoiEntity>> build(
    String hikeId,
  );
}

/// See also [PoisAroundHike].
@ProviderFor(PoisAroundHike)
const poisAroundHikeProvider = PoisAroundHikeFamily();

/// See also [PoisAroundHike].
class PoisAroundHikeFamily extends Family<AsyncValue<List<PoiEntity>>> {
  /// See also [PoisAroundHike].
  const PoisAroundHikeFamily();

  /// See also [PoisAroundHike].
  PoisAroundHikeProvider call(
    String hikeId,
  ) {
    return PoisAroundHikeProvider(
      hikeId,
    );
  }

  @override
  PoisAroundHikeProvider getProviderOverride(
    covariant PoisAroundHikeProvider provider,
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
  String? get name => r'poisAroundHikeProvider';
}

/// See also [PoisAroundHike].
class PoisAroundHikeProvider extends AutoDisposeAsyncNotifierProviderImpl<
    PoisAroundHike, List<PoiEntity>> {
  /// See also [PoisAroundHike].
  PoisAroundHikeProvider(
    String hikeId,
  ) : this._internal(
          () => PoisAroundHike()..hikeId = hikeId,
          from: poisAroundHikeProvider,
          name: r'poisAroundHikeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$poisAroundHikeHash,
          dependencies: PoisAroundHikeFamily._dependencies,
          allTransitiveDependencies:
              PoisAroundHikeFamily._allTransitiveDependencies,
          hikeId: hikeId,
        );

  PoisAroundHikeProvider._internal(
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
    covariant PoisAroundHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }

  @override
  Override overrideWith(PoisAroundHike Function() create) {
    return ProviderOverride(
      origin: this,
      override: PoisAroundHikeProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<PoisAroundHike, List<PoiEntity>>
      createElement() {
    return _PoisAroundHikeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PoisAroundHikeProvider && other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PoisAroundHikeRef
    on AutoDisposeAsyncNotifierProviderRef<List<PoiEntity>> {
  /// The parameter `hikeId` of this provider.
  String get hikeId;
}

class _PoisAroundHikeProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PoisAroundHike,
        List<PoiEntity>> with PoisAroundHikeRef {
  _PoisAroundHikeProviderElement(super.provider);

  @override
  String get hikeId => (origin as PoisAroundHikeProvider).hikeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

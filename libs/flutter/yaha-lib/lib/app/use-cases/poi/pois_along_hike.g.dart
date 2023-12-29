// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pois_along_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$poisAlongHikeHash() => r'3c01857a073e19cd58423439bdad6d5267fcaf7f';

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

abstract class _$PoisAlongHike
    extends BuildlessAutoDisposeAsyncNotifier<List<PoiOfHikeEntity>> {
  late final String hikeId;

  FutureOr<List<PoiOfHikeEntity>> build(
    String hikeId,
  );
}

/// See also [PoisAlongHike].
@ProviderFor(PoisAlongHike)
const poisAlongHikeProvider = PoisAlongHikeFamily();

/// See also [PoisAlongHike].
class PoisAlongHikeFamily extends Family<AsyncValue<List<PoiOfHikeEntity>>> {
  /// See also [PoisAlongHike].
  const PoisAlongHikeFamily();

  /// See also [PoisAlongHike].
  PoisAlongHikeProvider call(
    String hikeId,
  ) {
    return PoisAlongHikeProvider(
      hikeId,
    );
  }

  @override
  PoisAlongHikeProvider getProviderOverride(
    covariant PoisAlongHikeProvider provider,
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
  String? get name => r'poisAlongHikeProvider';
}

/// See also [PoisAlongHike].
class PoisAlongHikeProvider extends AutoDisposeAsyncNotifierProviderImpl<
    PoisAlongHike, List<PoiOfHikeEntity>> {
  /// See also [PoisAlongHike].
  PoisAlongHikeProvider(
    String hikeId,
  ) : this._internal(
          () => PoisAlongHike()..hikeId = hikeId,
          from: poisAlongHikeProvider,
          name: r'poisAlongHikeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$poisAlongHikeHash,
          dependencies: PoisAlongHikeFamily._dependencies,
          allTransitiveDependencies:
              PoisAlongHikeFamily._allTransitiveDependencies,
          hikeId: hikeId,
        );

  PoisAlongHikeProvider._internal(
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
    covariant PoisAlongHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }

  @override
  Override overrideWith(PoisAlongHike Function() create) {
    return ProviderOverride(
      origin: this,
      override: PoisAlongHikeProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<PoisAlongHike, List<PoiOfHikeEntity>>
      createElement() {
    return _PoisAlongHikeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PoisAlongHikeProvider && other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PoisAlongHikeRef
    on AutoDisposeAsyncNotifierProviderRef<List<PoiOfHikeEntity>> {
  /// The parameter `hikeId` of this provider.
  String get hikeId;
}

class _PoisAlongHikeProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PoisAlongHike,
        List<PoiOfHikeEntity>> with PoisAlongHikeRef {
  _PoisAlongHikeProviderElement(super.provider);

  @override
  String get hikeId => (origin as PoisAlongHikeProvider).hikeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

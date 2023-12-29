// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'end_points_of_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$endPointsOfHikeHash() => r'd0fc95e96613316abf7a8dd2670e0bc2e1fbe006';

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

abstract class _$EndPointsOfHike extends BuildlessAutoDisposeAsyncNotifier<
    Tuple2<PoiOfHikeEntity, PoiOfHikeEntity>> {
  late final String hikeId;

  FutureOr<Tuple2<PoiOfHikeEntity, PoiOfHikeEntity>> build(
    String hikeId,
  );
}

/// See also [EndPointsOfHike].
@ProviderFor(EndPointsOfHike)
const endPointsOfHikeProvider = EndPointsOfHikeFamily();

/// See also [EndPointsOfHike].
class EndPointsOfHikeFamily
    extends Family<AsyncValue<Tuple2<PoiOfHikeEntity, PoiOfHikeEntity>>> {
  /// See also [EndPointsOfHike].
  const EndPointsOfHikeFamily();

  /// See also [EndPointsOfHike].
  EndPointsOfHikeProvider call(
    String hikeId,
  ) {
    return EndPointsOfHikeProvider(
      hikeId,
    );
  }

  @override
  EndPointsOfHikeProvider getProviderOverride(
    covariant EndPointsOfHikeProvider provider,
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
  String? get name => r'endPointsOfHikeProvider';
}

/// See also [EndPointsOfHike].
class EndPointsOfHikeProvider extends AutoDisposeAsyncNotifierProviderImpl<
    EndPointsOfHike, Tuple2<PoiOfHikeEntity, PoiOfHikeEntity>> {
  /// See also [EndPointsOfHike].
  EndPointsOfHikeProvider(
    String hikeId,
  ) : this._internal(
          () => EndPointsOfHike()..hikeId = hikeId,
          from: endPointsOfHikeProvider,
          name: r'endPointsOfHikeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$endPointsOfHikeHash,
          dependencies: EndPointsOfHikeFamily._dependencies,
          allTransitiveDependencies:
              EndPointsOfHikeFamily._allTransitiveDependencies,
          hikeId: hikeId,
        );

  EndPointsOfHikeProvider._internal(
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
  FutureOr<Tuple2<PoiOfHikeEntity, PoiOfHikeEntity>> runNotifierBuild(
    covariant EndPointsOfHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }

  @override
  Override overrideWith(EndPointsOfHike Function() create) {
    return ProviderOverride(
      origin: this,
      override: EndPointsOfHikeProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<EndPointsOfHike,
      Tuple2<PoiOfHikeEntity, PoiOfHikeEntity>> createElement() {
    return _EndPointsOfHikeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EndPointsOfHikeProvider && other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EndPointsOfHikeRef on AutoDisposeAsyncNotifierProviderRef<
    Tuple2<PoiOfHikeEntity, PoiOfHikeEntity>> {
  /// The parameter `hikeId` of this provider.
  String get hikeId;
}

class _EndPointsOfHikeProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<EndPointsOfHike,
        Tuple2<PoiOfHikeEntity, PoiOfHikeEntity>> with EndPointsOfHikeRef {
  _EndPointsOfHikeProviderElement(super.provider);

  @override
  String get hikeId => (origin as EndPointsOfHikeProvider).hikeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

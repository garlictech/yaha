// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_track_entity.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchTrackEntityHash() => r'9ce1b205f5848878dae8f2776073716ee9217faf';

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

abstract class _$FetchTrackEntity
    extends BuildlessAutoDisposeAsyncNotifier<TrackEntity> {
  late final String hikeId;

  FutureOr<TrackEntity> build(
    String hikeId,
  );
}

/// See also [FetchTrackEntity].
@ProviderFor(FetchTrackEntity)
const fetchTrackEntityProvider = FetchTrackEntityFamily();

/// See also [FetchTrackEntity].
class FetchTrackEntityFamily extends Family<AsyncValue<TrackEntity>> {
  /// See also [FetchTrackEntity].
  const FetchTrackEntityFamily();

  /// See also [FetchTrackEntity].
  FetchTrackEntityProvider call(
    String hikeId,
  ) {
    return FetchTrackEntityProvider(
      hikeId,
    );
  }

  @override
  FetchTrackEntityProvider getProviderOverride(
    covariant FetchTrackEntityProvider provider,
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
  String? get name => r'fetchTrackEntityProvider';
}

/// See also [FetchTrackEntity].
class FetchTrackEntityProvider extends AutoDisposeAsyncNotifierProviderImpl<
    FetchTrackEntity, TrackEntity> {
  /// See also [FetchTrackEntity].
  FetchTrackEntityProvider(
    String hikeId,
  ) : this._internal(
          () => FetchTrackEntity()..hikeId = hikeId,
          from: fetchTrackEntityProvider,
          name: r'fetchTrackEntityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchTrackEntityHash,
          dependencies: FetchTrackEntityFamily._dependencies,
          allTransitiveDependencies:
              FetchTrackEntityFamily._allTransitiveDependencies,
          hikeId: hikeId,
        );

  FetchTrackEntityProvider._internal(
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
  FutureOr<TrackEntity> runNotifierBuild(
    covariant FetchTrackEntity notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }

  @override
  Override overrideWith(FetchTrackEntity Function() create) {
    return ProviderOverride(
      origin: this,
      override: FetchTrackEntityProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<FetchTrackEntity, TrackEntity>
      createElement() {
    return _FetchTrackEntityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchTrackEntityProvider && other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchTrackEntityRef on AutoDisposeAsyncNotifierProviderRef<TrackEntity> {
  /// The parameter `hikeId` of this provider.
  String get hikeId;
}

class _FetchTrackEntityProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FetchTrackEntity,
        TrackEntity> with FetchTrackEntityRef {
  _FetchTrackEntityProviderElement(super.provider);

  @override
  String get hikeId => (origin as FetchTrackEntityProvider).hikeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

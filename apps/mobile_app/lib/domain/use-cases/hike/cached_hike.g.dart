// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cachedHikeHash() => r'157c47a197da582823d3422000430f66439b583a';

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

abstract class _$CachedHike extends BuildlessAutoDisposeAsyncNotifier<Hike?> {
  late final String hikeId;

  Future<Hike?> build(
    String hikeId,
  );
}

/// See also [CachedHike].
@ProviderFor(CachedHike)
const cachedHikeProvider = CachedHikeFamily();

/// See also [CachedHike].
class CachedHikeFamily extends Family<AsyncValue<Hike?>> {
  /// See also [CachedHike].
  const CachedHikeFamily();

  /// See also [CachedHike].
  CachedHikeProvider call(
    String hikeId,
  ) {
    return CachedHikeProvider(
      hikeId,
    );
  }

  @override
  CachedHikeProvider getProviderOverride(
    covariant CachedHikeProvider provider,
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
  String? get name => r'cachedHikeProvider';
}

/// See also [CachedHike].
class CachedHikeProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CachedHike, Hike?> {
  /// See also [CachedHike].
  CachedHikeProvider(
    this.hikeId,
  ) : super.internal(
          () => CachedHike()..hikeId = hikeId,
          from: cachedHikeProvider,
          name: r'cachedHikeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cachedHikeHash,
          dependencies: CachedHikeFamily._dependencies,
          allTransitiveDependencies:
              CachedHikeFamily._allTransitiveDependencies,
        );

  final String hikeId;

  @override
  bool operator ==(Object other) {
    return other is CachedHikeProvider && other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<Hike?> runNotifierBuild(
    covariant CachedHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

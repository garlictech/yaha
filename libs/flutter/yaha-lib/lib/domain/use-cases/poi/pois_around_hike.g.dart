// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pois_around_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$poisAroundHikeHash() => r'576a757e0c9dd5ac5063e464605c075a355aa4a4';

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
    extends BuildlessAutoDisposeNotifier<LoadableState<List<Poi>>> {
  late final String hikeId;

  LoadableState<List<Poi>> build(
    String hikeId,
  );
}

/// See also [PoisAroundHike].
@ProviderFor(PoisAroundHike)
const poisAroundHikeProvider = PoisAroundHikeFamily();

/// See also [PoisAroundHike].
class PoisAroundHikeFamily extends Family<LoadableState<List<Poi>>> {
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
class PoisAroundHikeProvider extends AutoDisposeNotifierProviderImpl<
    PoisAroundHike, LoadableState<List<Poi>>> {
  /// See also [PoisAroundHike].
  PoisAroundHikeProvider(
    this.hikeId,
  ) : super.internal(
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
        );

  final String hikeId;

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

  @override
  LoadableState<List<Poi>> runNotifierBuild(
    covariant PoisAroundHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

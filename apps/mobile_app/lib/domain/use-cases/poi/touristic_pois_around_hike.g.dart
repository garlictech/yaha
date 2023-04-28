// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'touristic_pois_around_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$touristicPoisAroundHikeHash() =>
    r'ace5850412557b9b53adf0cd07fd8e25721fcb9b';

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
    extends BuildlessAutoDisposeNotifier<LoadableState<List<Poi>>> {
  late final String hikeId;

  LoadableState<List<Poi>> build(
    String hikeId,
  );
}

/// See also [TouristicPoisAroundHike].
@ProviderFor(TouristicPoisAroundHike)
const touristicPoisAroundHikeProvider = TouristicPoisAroundHikeFamily();

/// See also [TouristicPoisAroundHike].
class TouristicPoisAroundHikeFamily extends Family<LoadableState<List<Poi>>> {
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
class TouristicPoisAroundHikeProvider extends AutoDisposeNotifierProviderImpl<
    TouristicPoisAroundHike, LoadableState<List<Poi>>> {
  /// See also [TouristicPoisAroundHike].
  TouristicPoisAroundHikeProvider(
    this.hikeId,
  ) : super.internal(
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
        );

  final String hikeId;

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

  @override
  LoadableState<List<Poi>> runNotifierBuild(
    covariant TouristicPoisAroundHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

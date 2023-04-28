// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'touristic_pois_along_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$touristicPoisAlongHikeHash() =>
    r'7ca6075d00ee425a434d217cb63da939666ec018';

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
    extends BuildlessAutoDisposeNotifier<LoadableState<List<PoiOfHike>>> {
  late final String hikeId;

  LoadableState<List<PoiOfHike>> build(
    String hikeId,
  );
}

/// See also [TouristicPoisAlongHike].
@ProviderFor(TouristicPoisAlongHike)
const touristicPoisAlongHikeProvider = TouristicPoisAlongHikeFamily();

/// See also [TouristicPoisAlongHike].
class TouristicPoisAlongHikeFamily
    extends Family<LoadableState<List<PoiOfHike>>> {
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
class TouristicPoisAlongHikeProvider extends AutoDisposeNotifierProviderImpl<
    TouristicPoisAlongHike, LoadableState<List<PoiOfHike>>> {
  /// See also [TouristicPoisAlongHike].
  TouristicPoisAlongHikeProvider(
    this.hikeId,
  ) : super.internal(
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
        );

  final String hikeId;

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

  @override
  LoadableState<List<PoiOfHike>> runNotifierBuild(
    covariant TouristicPoisAlongHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

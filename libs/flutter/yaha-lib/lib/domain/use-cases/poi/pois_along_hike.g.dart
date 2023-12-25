// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pois_along_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$poisAlongHikeHash() => r'f9fd57b8c1b419934e3ab5aa04902f7f285b763f';

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
    extends BuildlessAutoDisposeNotifier<LoadableState<List<PoiOfHike>>> {
  late final String hikeId;

  LoadableState<List<PoiOfHike>> build(
    String hikeId,
  );
}

/// See also [PoisAlongHike].
@ProviderFor(PoisAlongHike)
const poisAlongHikeProvider = PoisAlongHikeFamily();

/// See also [PoisAlongHike].
class PoisAlongHikeFamily extends Family<LoadableState<List<PoiOfHike>>> {
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
class PoisAlongHikeProvider extends AutoDisposeNotifierProviderImpl<
    PoisAlongHike, LoadableState<List<PoiOfHike>>> {
  /// See also [PoisAlongHike].
  PoisAlongHikeProvider(
    this.hikeId,
  ) : super.internal(
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
        );

  final String hikeId;

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

  @override
  LoadableState<List<PoiOfHike>> runNotifierBuild(
    covariant PoisAlongHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

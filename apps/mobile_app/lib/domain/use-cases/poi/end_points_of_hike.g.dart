// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'end_points_of_hike.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$endPointsOfHikeHash() => r'362207844cb3b922bcad72e9bfe65acf917c64d3';

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

abstract class _$EndPointsOfHike
    extends BuildlessAutoDisposeNotifier<Tuple2<PoiOfHike, PoiOfHike>?> {
  late final String hikeId;

  Tuple2<PoiOfHike, PoiOfHike>? build(
    String hikeId,
  );
}

/// See also [EndPointsOfHike].
@ProviderFor(EndPointsOfHike)
const endPointsOfHikeProvider = EndPointsOfHikeFamily();

/// See also [EndPointsOfHike].
class EndPointsOfHikeFamily extends Family<Tuple2<PoiOfHike, PoiOfHike>?> {
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
class EndPointsOfHikeProvider extends AutoDisposeNotifierProviderImpl<
    EndPointsOfHike, Tuple2<PoiOfHike, PoiOfHike>?> {
  /// See also [EndPointsOfHike].
  EndPointsOfHikeProvider(
    this.hikeId,
  ) : super.internal(
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
        );

  final String hikeId;

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

  @override
  Tuple2<PoiOfHike, PoiOfHike>? runNotifierBuild(
    covariant EndPointsOfHike notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

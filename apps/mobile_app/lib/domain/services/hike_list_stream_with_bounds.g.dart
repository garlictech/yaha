// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hike_list_stream_with_bounds.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hikeListStreamWithBoundsHash() =>
    r'af8133b9260b027bd791be29c188ab0d49e16e38';

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

abstract class _$HikeListStreamWithBounds
    extends BuildlessAutoDisposeStreamNotifier<
        Tuple2<List<Hike>, LatLngBounds>> {
  late final String hikeId;

  Stream<Tuple2<List<Hike>, LatLngBounds>> build(
    String hikeId,
  );
}

/// See also [HikeListStreamWithBounds].
@ProviderFor(HikeListStreamWithBounds)
const hikeListStreamWithBoundsProvider = HikeListStreamWithBoundsFamily();

/// See also [HikeListStreamWithBounds].
class HikeListStreamWithBoundsFamily
    extends Family<AsyncValue<Tuple2<List<Hike>, LatLngBounds>>> {
  /// See also [HikeListStreamWithBounds].
  const HikeListStreamWithBoundsFamily();

  /// See also [HikeListStreamWithBounds].
  HikeListStreamWithBoundsProvider call(
    String hikeId,
  ) {
    return HikeListStreamWithBoundsProvider(
      hikeId,
    );
  }

  @override
  HikeListStreamWithBoundsProvider getProviderOverride(
    covariant HikeListStreamWithBoundsProvider provider,
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
  String? get name => r'hikeListStreamWithBoundsProvider';
}

/// See also [HikeListStreamWithBounds].
class HikeListStreamWithBoundsProvider
    extends AutoDisposeStreamNotifierProviderImpl<HikeListStreamWithBounds,
        Tuple2<List<Hike>, LatLngBounds>> {
  /// See also [HikeListStreamWithBounds].
  HikeListStreamWithBoundsProvider(
    this.hikeId,
  ) : super.internal(
          () => HikeListStreamWithBounds()..hikeId = hikeId,
          from: hikeListStreamWithBoundsProvider,
          name: r'hikeListStreamWithBoundsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$hikeListStreamWithBoundsHash,
          dependencies: HikeListStreamWithBoundsFamily._dependencies,
          allTransitiveDependencies:
              HikeListStreamWithBoundsFamily._allTransitiveDependencies,
        );

  final String hikeId;

  @override
  bool operator ==(Object other) {
    return other is HikeListStreamWithBoundsProvider && other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Stream<Tuple2<List<Hike>, LatLngBounds>> runNotifierBuild(
    covariant HikeListStreamWithBounds notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

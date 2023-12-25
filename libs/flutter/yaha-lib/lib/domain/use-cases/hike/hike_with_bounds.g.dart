// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hike_with_bounds.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hikeWithBoundsHash() => r'8caf4605d1302266510666713771b543078e14d2';

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

abstract class _$HikeWithBounds
    extends BuildlessAutoDisposeNotifier<Tuple2<Hike, LatLngBounds>?> {
  late final String hikeId;

  Tuple2<Hike, LatLngBounds>? build(
    String hikeId,
  );
}

/// See also [HikeWithBounds].
@ProviderFor(HikeWithBounds)
const hikeWithBoundsProvider = HikeWithBoundsFamily();

/// See also [HikeWithBounds].
class HikeWithBoundsFamily extends Family<Tuple2<Hike, LatLngBounds>?> {
  /// See also [HikeWithBounds].
  const HikeWithBoundsFamily();

  /// See also [HikeWithBounds].
  HikeWithBoundsProvider call(
    String hikeId,
  ) {
    return HikeWithBoundsProvider(
      hikeId,
    );
  }

  @override
  HikeWithBoundsProvider getProviderOverride(
    covariant HikeWithBoundsProvider provider,
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
  String? get name => r'hikeWithBoundsProvider';
}

/// See also [HikeWithBounds].
class HikeWithBoundsProvider extends AutoDisposeNotifierProviderImpl<
    HikeWithBounds, Tuple2<Hike, LatLngBounds>?> {
  /// See also [HikeWithBounds].
  HikeWithBoundsProvider(
    this.hikeId,
  ) : super.internal(
          () => HikeWithBounds()..hikeId = hikeId,
          from: hikeWithBoundsProvider,
          name: r'hikeWithBoundsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$hikeWithBoundsHash,
          dependencies: HikeWithBoundsFamily._dependencies,
          allTransitiveDependencies:
              HikeWithBoundsFamily._allTransitiveDependencies,
        );

  final String hikeId;

  @override
  bool operator ==(Object other) {
    return other is HikeWithBoundsProvider && other.hikeId == hikeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hikeId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Tuple2<Hike, LatLngBounds>? runNotifierBuild(
    covariant HikeWithBounds notifier,
  ) {
    return notifier.build(
      hikeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
